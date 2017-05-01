class CreateJoinTableDishPricture < ActiveRecord::Migration[5.0]
  def change
    create_join_table :dishes, :pictures do |t|
      # t.index [:dish_id, :picture_id]
      # t.index [:picture_id, :dish_id]
    end
  end
end
