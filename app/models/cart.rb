class Cart < ApplicationRecord

  has_many :cart_items, :dependent => :destroy
  has_many :dishes, :through => :cart_items
  belongs_to :user, optional: true


  def total_price
    cart_items.map {|cart_item| cart_item.total_price}.sum
  end

  # def total
  #   @data.inject(0) {|sum, item| CartItem.find(item[0].to_i).unit_price * item.quantity + sum}
  # end

  def remove(item)
    if item.amount > 1
      item.update_attribute(:amount, item.amount - 1)
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
