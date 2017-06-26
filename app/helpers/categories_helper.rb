module CategoriesHelper

  def price_category_chart_data

    @categories.map do |category|
      final_price = 0
      category.dishes.each do |dish|
        if dish.user_id == current_user.id then
          final_price += dish.price
        end
      end
      {
        category_name: category.name,
        total: final_price
      }
    end

  end

end
