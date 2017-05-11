class CartItemsController < ApplicationController
  # def create
  #   current_cart.cart_items.create!(params[:cart_item])
  #   flash[:notice] = "Product added to cart"
  #   session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
  #   redirect_to current_cart_url
  # end

  def create
    cart_data = session[:cart] || {}
    dish_id = params[:dish_id]
    cart_data[dish_id] ||= 0
    cart_data[dish_id] += 1
    session[:cart] = cart_data
    redirect_to dishes_path, alert: 'Added to Cart !'
  end



end
