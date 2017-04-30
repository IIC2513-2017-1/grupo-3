class CreateJoinTableDishCategory < ActiveRecord::Migration[5.0]
  def change
    create_join_table :dishes, :categories do |t|
      # t.index [:dish_id, :category_id]
      # t.index [:category_id, :dish_id]
    end
  end
end
