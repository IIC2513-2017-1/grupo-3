class StaticPagesController < ApplicationController

  def admin_help
    @dishes = Dish.all
    @users = User.all
  end

end
