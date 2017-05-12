class CartItemsController < ApplicationController
  # def create
  #   current_cart.cart_items.create!(params[:cart_item])
  #   flash[:notice] = "Product added to cart"
  #   session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
  #   redirect_to current_cart_url
  # end

  def create
    dish = Dish.find(params[:dish_id])
    @cart.add_dish(dish)
    session[:cart] = @cart.data
    redirect_to dishes_path
    flash[:notice] = 'Dish added to cart!'
  end

  def index
    @cart_items = @cart.items
  end

end
