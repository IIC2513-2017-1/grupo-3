class OrderItem < ApplicationRecord
  belongs_to :dish
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  before_save :finalize

  def total_price
    unit_price * quantity
  end

  scope :pending_items, ( -> { where('pending = ?', true)})

private
  def product_present
    if dish.nil?
      errors.add(:dish, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
