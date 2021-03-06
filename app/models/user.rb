class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token,
                :new_password, :new_password_confirmation
  has_secure_password
  before_save :downcase_email
  before_create :create_activation_digest
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name,
            presence: true,
            length: { maximum: 25 },
            if: :password_required?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }

  with_options if: :password_required? do |user|
    user.validates :password, presence: true, length: { minimum: 6 }, if: :password_changed?
  end

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "default.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/, /PNG\Z/, /JPE?G\Z/]

  with_options if: :is_cook? do |cook|
      cook.validates :avatar, presence: true, on: :update
      cook.validates :address, presence: true, length: { minimum: 5 }, on: :update
  end

  geocoded_by :address
  after_validation :geocode_or_reset_coordinates, if: :address_changed?
  before_validation :geocode, on: :update

  has_many :reviews
  has_many :rates
  has_many :dishes
  has_many :orders
  has_many :favorites
  has_many :favorite_dishes, through: :favorites, source: :favorited, source_type: 'Dish'
  has_one  :cart
  has_one  :bank_account

  scope :with_active_discounts, (-> { joins(:dishes).where('dishes.discounts.active.size > 0') })

  def downcase_email
    self.email = email.downcase
  end

  def password_changed?
    @new_password.present? || !@new_password.nil? || @new_password_confirmation.present? || !@new_password_confirmation.nil?
  end

  def password_required?
    provider.nil?
  end

  def is_cook?
    role == 'cook'
  end

  def is_admin?
    role == 'admin'
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, twitter_uid: auth_hash.uid).first
    if user.nil?
      user = User.create(provider: auth_hash.provider, twitter_uid: auth_hash.uid)
      # user = where(provider: auth_hash.provider, twitter_uid: auth_hash.uid).first_or_create
      user.update(
        first_name: auth_hash.info.name,
        email: auth_hash.info.email,
        role: 'user',
        password: SecureRandom.urlsafe_base64,
        avatar: auth_hash.info.image.sub('_normal', ''),
        token: auth_hash.credentials.token,
        secret: auth_hash.credentials.secret
      )
      user.activate
    end
    user
  end

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.secrets.twitter_api_key
      config.consumer_secret = Rails.secrets.twitter_api_secrets
      config.access_token = token
      config.access_token_secret = secret
    end
  end

  def avg_stars
    count = 0.0
    dishes.each do |dish|
      count += dish.avg_forks
    end
    count / dishes.size
  end

  # Activates an account.
  def activate
    update(activated: true,
           activated_at: Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def send_email(from, to, subject, message)
    from = Email.new(email: from)
    to = Email.new(email: to)
    content = Content.new(type: 'text/html; charset=UTF-8', value: message)
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def generate_api_token_and_save
    loop do
      self.api_token = SecureRandom.hex(64)
      break if save
    end
  end

  private

  def geocode_or_reset_coordinates
    if geocode.nil?
      self.latitude = nil
      self.longitude = nil
    end
  end

end
