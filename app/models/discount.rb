class Discount < ApplicationRecord
  belongs_to :dish
  validates :to_date, presence: true
  validates :discount_percent, presence: true, :inclusion => 0..100
  validate :to_date_cannot_be_in_the_past
  validate :from_date_cannot_be_in_the_past
  validate :to_date_cannot_be_before_from_date


  # Validaciones
  def to_date_cannot_be_in_the_past
    if to_date.present? && to_date < Time.zone.today
      errors.add(:to_date, "can't be in the past")
    end
  end
  def from_date_cannot_be_in_the_past
    if from_date.present? && from_date < Time.zone.today
      errors.add(from_date, "can't be in the past")
    end
  end
  def to_date_cannot_be_before_from_date
    if to_date < from_date
      errors.add(:to_date, "can't be in the past")
    end
  end


end
