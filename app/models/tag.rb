class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }

  has_many :taggings
  has_many :dishes, through: :taggings

end
