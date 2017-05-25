class Review < ApplicationRecord

  validates :body, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: { maximum: 45 }

  belongs_to :user
  belongs_to :dish
  has_one :rate, dependent: :destroy
  accepts_nested_attributes_for :rate

end
