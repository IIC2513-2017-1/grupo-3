class CartsController < ApplicationController
  # before_action :set_cart, only: [:show, :destroy]

  def show
    @cart = Cart.find(params[:id])
  end

  def remove
    @item = @cart.remove_item(params[:id])
    redirect_to cart_path(current_cart.id), notice: "Removed 1 #{@item.dish.name}"
  end

  def delete
    @item = CartItem.find(params[:id])
    @item.destroy
    redirect_to cart_path(current_cart.id), notice: 'Cart item deleted'
  end

  # private
  #
  # def set_cart
  #   @cart = Cart.find(params[:id])
  # end

  # def cart_params
  #   params.require(:cart).permit(:id)
  # end
end
