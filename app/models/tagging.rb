class Tagging < ApplicationRecord
  belongs_to :tag, dependent: :destroy
  belongs_to :dish
end
