class DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy]
  before_action :dish_owner, only: [:edit, :update, :destroy]
  # GET /discounts
  # GET /discounts.json
  def index
    @discounts = Discount.all
  end

  # GET /discounts/1
  # GET /discounts/1.json
  def show
  end

  # GET /discounts/new
  def new
    @dish = Dish.find(params[:dish_id])
    @discount = @dish.discounts.build
    # @discount = Discount.new
  end

  # GET /discounts/1/edit
  def edit
  end

  # POST /discounts
  # POST /discounts.json
  def create
    # @dish = Dish.find(params[:dish_id])
    # @discount = @dish.discounts.new(discount_params)
    @discount = Discount.new(discount_params)
    respond_to do |format|
      if @discount.save
        format.html { redirect_to @discount, notice: 'Discount was successfully created.' }
        format.json { render :show, status: :created, location: @discount }
      else
        format.html { render :new }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discounts/1
  # PATCH/PUT /discounts/1.json
  def update
    respond_to do |format|
      if @discount.update(discount_params)
        format.html { redirect_to @discount, notice: 'Discount was successfully updated.' }
        format.json { render :show, status: :ok, location: @discount }
      else
        format.html { render :edit }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounts/1
  # DELETE /discounts/1.json
  def destroy
    @discount.destroy
    respond_to do |format|
      format.html { redirect_to discounts_url, notice: 'Discount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Confirms the correct user.
    def dish_owner
      user = Dish.find(params[:dish_id]).user if params[:id]
      redirect_to(dishes_path) unless current_user?(user) || current_user.role == 'admin'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_params
      params.require(:discount).permit(:from_date, :to_date, :discount_percent, :dish_id, @dish)
    end
end
