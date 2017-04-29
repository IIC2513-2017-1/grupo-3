class Cook < ApplicationRecord
  before_save :downcase_email
  validates :first_name, presence: true, length: { maximum: 25 }, on: :create
  validates :last_name, presence: true, length: { maximum: 25 }, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, length: { minimum: 6 }, on: :create
  validates :address, presence: true, on: :create
  validates :phone, presence: true, on: :create
  validates :terms_of_service, acceptance: true

  has_many :dishes
  has_many :orders, through: :dishes

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "default.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  validates :avatar, presence: true, on: :create

  def downcase_email
    self.email = email.downcase
  end
end
