class Dish < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 200 }

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  has_many :orders
  belongs_to :cook


  def self.search(search)
  if search
    self.where("(name like ? OR name like ?) OR (cook like ? OR cook like ?) OR (category like ? OR category like ?)", "#{search}%", "% #{search}%", "#{search}%", "% #{search}%", "#{search}%", "% #{search}%")
  else
    self.all
  end
  end
end
