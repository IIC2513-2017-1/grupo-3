class StaticPagesController < ApplicationController

  def admin_help
    @dishes = Dish.all
    @users = User.all
    @tags = Tag.all
    @categories = Category.all
    @reviews = Review.all
    @orders = Order.all
    if not current_user
      redirect_to(root_url)
      return
    elsif current_user.role != "admin"
      redirect_to(root_url)
      return
    end
  end

  def shopping_history
    @user = current_user
    @orders = Order.select { |order| order.user_id == @user.id }
  end

  def promotions
  end

  def app_info
    if not current_user
      redirect_to(root_url)
      return
    elsif current_user.role != "admin"
      redirect_to(root_url)
      return
    end
  end

  def statistics
    @dishes = Dish.all
    @users = User.all
    @tags = Tag.all
    @categories = Category.all
    @reviews = Review.all
    if not current_user
      redirect_to(root_url)
      return
    elsif current_user.role != "admin"
      redirect_to(root_url)
      return
    end
  end

  def popular_cooks
    @users = User.select { |user| user.role == "cook" }
  end

  def popular_dishes
    @dishes = Dish.all
  end

  def cooks_statistics
    @categories = Category.all
    @dishes = Dishes.select {|dish| dish.user_id == current_user.id }
  end

end
