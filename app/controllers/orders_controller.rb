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
    @cart = current_cart
    if @cart.items.empty?
        flash[:error] = "Your cart is empty"
        redirect_to :back
        return
    end

    @order = Order.new

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    order = find_order
    render(
      locals: {
        order: order
      })
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
    # def set_order
    #   @order = Order.find(params[:id])
    # end

    def find_order
      Order
        .includes(:dishes)
        .find(params.fetch(:id))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def order_params
    #   params.require(:order).permit(:final_price, :status, :tipping, :tips, :payment_method, :delivery_time)
    # end
end
