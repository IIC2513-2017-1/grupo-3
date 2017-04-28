class Review < ApplicationRecord

  validates :text, presence: true 

  belongs_to :users
  belongs_to :dish

end
