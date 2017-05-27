class CartItemsController < ApplicationController
  # before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  # def create
  #   current_cart.cart_items.create!(params[:cart_item])
  #   flash[:notice] = "Dish added to cart"
  #   session[:last_dish_page] = request.env['HTTP_REFERER'] || dishs_url
  #   redirect_to current_cart_url
  # end




  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = Review.new(review_params)
    respond_to do |format|
      if @cart_item.save
        # format.html { redirect_to dishes_, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        # format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  #
  # def create
  #   @cart = current_cart
  #   if @cart.nil?
  #     @cart = Cart.create
  #   end
  #   @dish = Dish.find(params[:dish_id])
  #   if CartItem.exists?(cart_id: current_cart.id, :dish_id => @dish.id)
  #     item = CartItem.find(:first, :conditions => [ "cart_id = #{current_cart.id} AND dish_id = #{@dish.id}" ])
  #     CartItem.update(item.id, amount: item.amount + 1)
  #   else
  #     @cart_item = CartItem.new
  #     @cart_item.amount = 1
  #     @cart_item.dish_id = @dish.id
  #     @cart_item.cart_id = @cart.id
  #     @cart_item.price = @dish.price
  #     @cart_item.save
  #     # CartItem.update(@cart_item.id, amount: 1)
  #     # CartItem.update(@cart_item.id, dish_id: @dish.id)
  #     # CartItem.update(@cart_item.id, cart_id: @cart.id)
  #     # CartItem.update(@cart_item.id, price: @dish.price)
  #     # create(cart_id: @cart.id, dish_id: @dish.id, amount: 1, price: @dish.price)
  #   end
  #   redirect_to dishes_path, alert: "#{@dish.name} added to cart"
  # end
    # @cart = current_cart
    # @cart.add_item(params[:item_id])
    # session[:cart] = @cart.data
    # if current_cart.nil?
    #   flash[:error] = "No cart"
    # end
    #
    # redirect_to dishes_path, alert: "Dish added to cart"

    # @cart_item = CartItem.new(cart_items_params)
    # respond_to do |format|
    #   if @cart_item.save
    #     format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
    #     format.json { render :show, status: :created, location: @cart_item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @cart_item.errors, status: :unprocessable_entity }
    #   end
    # end
  # end

  def update
    respond_to do |format|
      if @cart_item.update(cart_items_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def index
    # @cart_items = @
    @cart_items = @cart.items
  end

  def destroy
    # @cart_item = @cart.items.find(params[:id])
    # if !@cart_item.nil? && @cart_item.amount > 1
    #   @cart_item.amount -= 1
    # else
    #   @cart.data.delete(@cart_item.id.to_s)
    #   @cart_item.destroy
    # end
    # @cart_item
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_items_params
    params.require(:cart_item).permit(:cart_id, :dish_id, :amount)
    # .tap {|p| p[:cart_id] = cart_id}
  end

end
