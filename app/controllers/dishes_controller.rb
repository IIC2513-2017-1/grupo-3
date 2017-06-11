class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :dish_owner, only: [:edit, :update, :destroy]

  # GET /dishes
  # GET /dishes.json
  def index
    if params[:tag]
      @dishes = Dish.tagged_with(params[:tag]).paginate(per_page: 8, page: params[:page])
    else
      @dishes = Dish.paginate(:per_page => 8, page: params[:page])
    end
    # @order_item = current_order.order_items.new
    #@dishes = @dishes.search(params[:search]).order("created_at DESC") if params[:search].present?
    if !params[:search].blank?
      @dishes = Dish.search(params[:search]).paginate(per_page: 8, page: params[:page]).order("created_at DESC")
    else
      @dishes = Dish.paginate(per_page: 8, page: params[:page]).order("created_at DESC")
    end
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    @dish = Dish.find(params[:id])
    @pictures = @dish.pictures
    @reviews = @dish.reviews.paginate(per_page: 5, page: params[:page])
    @review = Review.new
  end

  def add_to_cart
    if session[:cart_id].blank?
      cart = Cart.create(status: 'pending')
      session[:cart_id] = cart.id
    else
      cart = Cart.find(session[:cart_id])
    end
      @dish = Dish.find(params[:id])
      item = cart.cart_items.where("dish_id = ?", @dish.id).first
      if item.present?
        item.update(amount: item.amount + 1)
      else
        cart.cart_items.create(dish_id: @dish.id, amount: 1)
      end
      redirect_to cart, notice: "#{@dish.name} added to cart"

  end

  # GET /dishes/new
  def new
    @dish = Dish.new
    @categories = Category.all
  end

  # GET /dishes/1/edit
  def edit
  end

  def toggle_activate
    @dish = Dish.find(params[:id])
    @dish.toggle!(:active)
    if @dish.active
      redirect_to user_dishes_path_url(current_user.id), notice: "#{@dish.name} is now active"
    else
      redirect_to user_dishes_path_url(current_user.id), notice: "#{@dish.name} is now unactive"
    end
  end

  # def toggle_activate
  # @dish = Dish.find(params[:id])
  #
  #   if @dish.active
  #     @dish.update_attributes(active: false)
  #   else
  #     @dish.update_attributes(active: true)
  #   end
  #     flash[:success] = "#{@dish.name} is now active"
  # end

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
        format.html { redirect_to dishes_path, notice: 'Dish was successfully created.' }
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
        format.html { redirect_to dishes_path, notice: 'Dish was successfully updated.' }
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

  # Confirms the correct user.
  def dish_owner
    @user = Dish.find(params[:id]).user if params[:id]
    redirect_to(dishes_path) unless current_user?(@user) || admin?
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def dish_params
    params.require(:dish).permit(:name, :price, :active, :description, :times_buyed, :pictures, :user_id, :tag_list, :category_list, @user)
  end
end
