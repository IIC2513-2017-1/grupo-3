class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :dish

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :dish_present
  validate :cart_present


  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

end
