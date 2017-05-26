class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }

  has_many :categorizings
  has_many :dishes, through: :categorizings

  # CONSULTAR AYUDANTE SOBRE RELACIÓN -> has_and_belongs_to_many


end
