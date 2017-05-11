class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :dish

  before_create :default_quantity_to_one

  validates :quantity, presence: true, numericality: { only_integer: true,
                                                       greater_than: 0 }
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

  private

  def default_quantity_to_one
    self.quantity ||= 1
  end
end
