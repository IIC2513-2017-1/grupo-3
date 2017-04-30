class CreateJoinTableDishTag < ActiveRecord::Migration[5.0]
  def change
    create_join_table :dishes, :tags do |t|
      # t.index [:dish_id, :tag_id]
      # t.index [:tag_id, :dish_id]
    end
  end
end
