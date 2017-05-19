class Rate < ApplicationRecord
  belongs_to :users
  belongs_to :dish
  belongs_to :review

  validates :forks, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 5] }
end
