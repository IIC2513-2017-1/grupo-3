class Review < ApplicationRecord

  validates :body, length: { maximum: 500 }
  validates :title, length: { maximum: 45 }
  validates :forks, presence: true, allow_blank: true, :inclusion => { :in => [0,5] }
  belongs_to :user
  belongs_to :dish

end
