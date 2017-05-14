class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
    # @order_item = current_order.order_items.new
    #@dishes = @dishes.search(params[:search]).order("created_at DESC") if params[:search].present?
    if params[:search]
      @dishes = Dish.search(params[:search]).order("created_at DESC")
    else
      @dishes = Dish.all.order("created_at DESC")
    end
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    @dish = Dish.find(params[:id])
    @pictures = @dish.pictures
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)
    @dish.user_id = current_user.id

    respond_to do |format|
      if @dish.save
        if params[:images]
          params[:images].each { |image|
            @dish.pictures.create(image: image)
          }
        end
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        if params[:images]
          params[:images].each { |image|
            @dish.pictures.create(image: image)
          }
        end
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :price, :description, :times_buyed, :pictures, @user)
    end
end
