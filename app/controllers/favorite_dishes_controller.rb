class FavoriteDishesController < ApplicationController
  before_action :set_dish

  def create
    if Favorite.create(favorited: @dish, user: current_user)
      redirect_to @dish, notice: 'Dish has been favorited'
    else
      redirect_to @dish, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @dish.id, user_id: current_user.id).first.destroy
    redirect_to @dish, notice: 'Dish is no longer in favorites'
  end

  private

  def set_dish
    @dish = Dish.find(params[:dish_id] || params[:id])
  end
end
