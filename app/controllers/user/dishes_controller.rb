class User::DishesController < ApplicationController
  def index
    @dishes = current_user.dishes
  end

  def create
    @dish = Dish.new(dish_params)
    respond_to do |format|
      if @dish.save
        if params[:images]
          params[:images].each { |image|
            @dish.pictures.create(image: image)
          }
        end
        current_user.dishes << @dish
        format.html { redirect_to @dish, notice: 'User Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @dishes = current_user.dishes.find(params[:id])
  end

  def update
    dish = current_user.dishes.find(params[:id])
    respond_to do |format|
      if dish.update(dish_params)
        if params[:images]
          params[:images].each { |image|
            dish.pictures.create(image: image)
          }
        end
        format.html { redirect_to dish, notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: dish }
      else
        format.html { render :edit }
        format.json { render json: dish.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    dish = current_user.dishes.find(params[:id])
    dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
  def load_dish
    @dish = Dish.find(params[:dish_id])
  end
  private
  def user_dishes_params
    params.require(:dish).permit(:user_id)
  end
end
