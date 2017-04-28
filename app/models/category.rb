class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }

  # CONSULTAR AYUDANTE SOBRE RELACIÓN -> has_and_belongs_to_many

end
