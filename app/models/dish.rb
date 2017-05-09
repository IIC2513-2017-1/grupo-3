class Dish < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 200 }

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  has_many :order_items
  belongs_to :user
  has_many :pictures, :dependent => :destroy

  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  #   validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  def self.search(search)
  if search
    self.where("(name like ? OR name like ?) OR (cook like ? OR cook like ?) OR (category like ? OR category like ?)", "#{search}%", "% #{search}%", "#{search}%", "% #{search}%", "#{search}%", "% #{search}%")
  else
    self.all
  end
  end
end
