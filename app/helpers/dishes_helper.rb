module DishesHelper

  def price_dish_chart_data
    @dishes = Dish.select {|dish| dish.user_id == current_user.id }
    @dishes.map do |dish|
      {
        dish_name: dish.name,
        total: dish.price*dish.times_buyed
      }
    end
  end
end
