# class Cart < ApplicationRecord
#   has_many :order_items
#
#   def add_dish(dish_params)
#     current_dish = order_items.find_by(dish_id: dish_params[:dish][:dish_id])
#     if current_dish
#       current_dish.quantity += dish_params[:dish][:quantity].to_i
#       current_dish.save
#     else
#       new_dish = order_items.create
#     end
#
# end
# # 
