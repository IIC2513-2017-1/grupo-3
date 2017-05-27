class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :dish
  before_create :default_quantity_to_one

  validates :amount, presence: true, numericality: { only_integer: true,
                                                       greater_than: 0 }
  def unit_price
    dish.price
  end

  def total_price
    unit_price * amount
  end

  private

  def default_quantity_to_one
    self.amount ||= 1
  end
end
