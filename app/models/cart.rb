class Cart < ApplicationRecord
  attr_reader :data

  has_many :cart_items
  has_many :dishes, :through => :cart_items


  def initialize(cart_data = {})
    @data = cart_data || Hash.new
  end

  def add_dish(dish)
    @data[dish.id.to_s] ||= 0
    @data[dish.id.to_s] += 1
  end

  def items
    @data.map do |dish_id, quantity|
      dish = Dish.find(dish_id)
      CartItem.new(dish, quantity)
    end
  end
end
