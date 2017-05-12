class Order < ApplicationRecord
  validates :card_number, presence: true, if: :paid_with_card?
  validates :final_price, presence: true
  validates :status, presence: true, inclusion: { in: %w(UNPAID PAID DELIVERED RECIEVED),
    message: "%{value} is not valid" }

  has_many :order_items
  belongs_to :users

  def total_price
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def paid_with_card?
    payment_type == "card"
  end

  def update_price
    self[:total_price] = total_price
  end

end
