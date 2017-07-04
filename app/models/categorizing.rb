class Categorizing < ApplicationRecord
  belongs_to :dish
  belongs_to :category, dependent: :destroy
end
