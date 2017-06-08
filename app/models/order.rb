class Order < ApplicationRecord
  # include ActiveModel::ForbiddenAttributesProtection
  attr_accessor :card_number, :card_expiration_month, :card_expiration_year, :card_verification_value
  # validates :card_number, presence: true, if: :paid_with_card?
  validates_size_of :order_items, :minimum => 1
  validates :status, presence: true, inclusion: { in: %w(UNPAID PAID DELIVERED RECIEVED),
    message: "%{value} is not valid" }

  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :dishes, through: :order_items

  def total_price
    order_items.map {|order_item| order_item.total_price}.sum
  end


  def update_price
    self[:total_price] = total_price
  end

  def pending
    order_items.each do |order|
      return true if order.pending == true
    end
    false
  end
end
