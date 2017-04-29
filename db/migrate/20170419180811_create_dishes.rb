class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description
      t.integer :times_buyed

      t.timestamps
    end
  end
end
