class RemoveForeignKeyOrdersFromDishes < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :orders, column: :dish_id
  end
end
