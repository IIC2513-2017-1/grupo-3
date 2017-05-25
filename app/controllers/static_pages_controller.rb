class StaticPagesController < ApplicationController

  def admin_help
    @dishes = Dish.all
    @users = User.all
    @tags = Tag.all
    @categories = Category.all
  end

  def shopping_history
    @user = current_user
    @orders = Order.select { |order| order.user_id == @user.id }
  end

end
