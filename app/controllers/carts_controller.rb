class CartsController < ApplicationController
  # before_action :set_cart, only: [:show, :destroy]

  def show
    @cart = Cart.find(params[:id])
  end

  def remove
    @item = @cart.remove_item(params[:id])
    respond_to do |format|
      format.html { redirect_to cart_path(current_cart.id), notice: "Removed 1 #{@item.dish.name}"}
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def delete
    @item = CartItem.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(current_cart.id), notice: 'Cart item deleted' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
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
