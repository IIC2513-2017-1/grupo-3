class Cart < ApplicationRecord
  attr_reader :data

  has_many :cart_items, :dependent => :destroy
  has_many :dishes, :through => :cart_items


  def initialize(cart_data = {})
    super()
    @data = cart_data || Hash.new(0)
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

  # def total
  #   @data.inject(0) {|sum, item| CartItem.find(item[0].to_i).unit_price * item.quantity + sum}
  # end

  def remove(item)
    if item.quantity > 1
      item.update_attribute(:quantity, item.quantity - 1)
    else
      CartItem.destroy(item.id)
    end
    item
  end

  # def destroy
  #   @cart = Cart.find(1)
  #   Cart.delete(@cart.id)
  #   session[:cart_id] = nil
  #   respond_to do |format|
  #     format.html { redirect_to store_url, notice: "Now your cart is empty." }
  #     format.json { head :ok }
  #   end
  # end

end
