class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    return redirect_to login_url if current_user.blank?
    orders = current_user.orders
    render(
      locals: {
        orders: orders
      })
  end

  def new
    @order = Order.new
  end


  def place_order
    @cart = current_cart
    if @cart.cart_items.empty?
        flash[:error] = "Your cart is empty"
        redirect_to :back
        return
    end
    @order = current_user.orders.new(params[:order])
    # @order.customer_ip = request.remote_ip
    populate_order
    if @order.save
      session.delete(:cart_id)
      redirect_to @order, notice: "Your order it's on it's way !"
    else
      redirect_to dishes_path, notice: "Couldn't place your order"
    end
  end


  def build_order
    @cart = current_cart
    if @cart.cart_items.empty?
        flash[:error] = "Your cart is empty"
        redirect_to :back
        return
    end
    @order = Order.new
    @order.update(user_id: current_user.id)
    @order.save
    # @order.cart = @cart
    @order.update(payment_method: 'Cash')
    if @order.payment_method == 'Credit card'
      @order.update(status: 'PAID')
    else
      @order.update(status: 'UNPAID')
    end
    @order.update(tipping: true)
    @order.update(tips: @cart.total_price * 0.1)
    if @order.tipping?
      @order.update(final_price: @cart.total_price * 1.1)
    else
      @order.update(final_price: @cart.total_price)
    end
    @order.save
    session.delete(:cart_id)
    redirect_to dishes_path
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  def completed
    order = find_order
    render(
      locals: {
        order: order
      })
  end

  # # GET /orders/new
  # def new
  #   @order = Order.new
  # end
  #
  # # GET /orders/1/edit
  # def edit
  # end
  #
  # # POST /orders
  # # POST /orders.json
  # def create
  #   @order = Order.new(order_params)
  #
  #   respond_to do |format|
  #     if @order.save
  #       format.html { redirect_to @order, notice: 'Order was successfully created.' }
  #       format.json { render :show, status: :created, location: @order }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /orders/1
  # # PATCH/PUT /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /orders/1
  # # DELETE /orders/1.json
  # def destroy
  #   @order.destroy
  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def populate_order
      current_cart.cart_items.each do |cart_item|
        order_item = OrderItem.new(
          :dish_id => cart_item.dish_id,
          :unit_price => cart_item.unit_price,
          :quantity => cart_item.amount
          )
        @order.order_items << order_item
      end
      @order.update(payment_method: 'Cash')
      if @order.payment_method == 'Credit card'
        @order.update(status: 'PAID')
      else
        @order.update(status: 'UNPAID')
      end
      @order.update(tipping: true)
      @order.update(tips: @cart.total_price * 0.1)
      if @order.tipping?
        @order.update(final_price: @cart.total_price * 1.1)
      else
        @order.update(final_price: @cart.total_price)
      end
    end

    #Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:final_price, :status, :tipping, :tips, :payment_method, :delivery_time, :cart_id)
    end
end
