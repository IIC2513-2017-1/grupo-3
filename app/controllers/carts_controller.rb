class CartsController < ApplicationController
  # before_action :set_cart, only: [:show, :destroy]
  # def destroy
  #   cart = session[:cart]
  #   item = cart.data.find { |item| item['product_id'] == params[:id].to_s }
  #   cart.data.delete item unless item.nil?
  #   redirect_to cart_path
  # end

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

  #
  #
  #
  # def destroy
  #   # @cart = current_cart
  #   @cart.destroy
  #   session[:cart] = nil
  #   @cart = Cart.create
  #   session[:cart] = @cart
  #   redirect_to cart_path, notice: 'Your cart is now empty'
  #
  # end
  #
  # private
  #
  # def set_cart
  #   @cart = Cart.find(params[:id])
  # end

  # def cart_params
  #   params.require(:cart).permit(:id)
  # end




  #   @cart.destroy if @cart == session[:cart]
  #   session[:cart] = nil
  #   respond_to do |format|
  #     format.html { redirect_to dishes_path_url, notice: 'Your cart is empty' }
  #     format.json { head :no_content }
  #   end
  # end
end
