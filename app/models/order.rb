class Order < ApplicationRecord
  validates :card_number, presence: true, if: :paid_with_card?
  validates :final_price, presence: true
  validates :status, presence: true, inclusion: { in: %w(UNPAID PAID DELIVERED RECIEVED),
    message: "%{value} is not valid" }

  def paid_with_card?
    payment_type == "card"
  end


end
