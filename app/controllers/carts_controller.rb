class CartsController < ApplicationController
  # def destroy
  #   cart = session[:cart]
  #   item = cart.data.find { |item| item['product_id'] == params[:id].to_s }
  #   cart.data.delete item unless item.nil?
  #   redirect_to cart_path
  # end


  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to cart_path, notice: 'Your cart is now empty'
  end

  # def remove
  #   @dish = Dish.find(params[:id])
  #   @item = @cart.remove_item(params[:id])
  #   redirect_to dishes_path_url, notice: 'Removed 1 <em>#{item.name}</em>'
    # flash[:notice] = 'Removed 1 <em>#{item.name}</em>'

  #   @cart.destroy if @cart == session[:cart]
  #   session[:cart] = nil
  #   respond_to do |format|
  #     format.html { redirect_to dishes_path_url, notice: 'Your cart is empty' }
  #     format.json { head :no_content }
  #   end
  # end
end
