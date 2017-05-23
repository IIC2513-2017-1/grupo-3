class StaticPagesController < ApplicationController

  def admin_help
    @dishes = Dish.all
    @users = User.all
    @tags = Tag.all
    @categories = Category.all
  end

end
