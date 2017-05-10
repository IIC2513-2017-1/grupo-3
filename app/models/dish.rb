class Dish < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 200 }

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  has_many :cart_items
  has_many :carts, :through => :cart_items
  # belongs_to :user
  has_many :pictures, :dependent => :destroy

  # default_scope { where(active: true) }


  def self.search(search)
  if search
    self.where("(name like ? OR name like ?) OR (cook like ? OR cook like ?) OR (category like ? OR category like ?)", "#{search}%", "% #{search}%", "#{search}%", "% #{search}%", "#{search}%", "% #{search}%")
  else
    self.all
  end
  end
end
