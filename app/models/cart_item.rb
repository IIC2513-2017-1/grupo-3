class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :dish
  attr_reader :quantity
  before_create :default_quantity_to_one

  validates :quantity, presence: true, numericality: { only_integer: true,
                                                       greater_than: 0 }
  validate :dish_present
  validate :cart_present

  def initialize(dish, quantity = 1)
    @item = dish
    @quantity = quantity
  end

  def name
    @item.name
  end

  def unit_price
    @item.price
  end

  def total_price
    unit_price * quantity
  end

  private

  def default_quantity_to_one
    self.quantity ||= 1
  end
end
