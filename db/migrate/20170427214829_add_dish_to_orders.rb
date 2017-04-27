class AddDishToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :dish, foreign_key: true
  end
end
