class Discount < ApplicationRecord
  belongs_to :dish
  validates :to_date, presence: true
  validates :discount_percent, presence: true, :inclusion => 0..100


end
