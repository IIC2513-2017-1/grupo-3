class Cart < ApplicationRecord
  attr_reader :data

  has_many :cart_items
  has_many :dishes, :through => :cart_items


  def initialize(cart_data)
    @data = cart_data || {}
  end

  def add_dish(dish_id)
    @data[dish_id] ||= 0
    @data[dish_id] += 1
  end

end
#
