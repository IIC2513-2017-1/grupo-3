class CreateCartItems < ActiveRecord::Migration[5.0]
  def up
    create_table :cart_items do |t|
      t.column :dish_id, :integer
      t.column :cart_id, :integer
      t.column :price, :decimal, precision: 12, scale: 3
      t.column :amount, :integer
      t.column :created_at, :datetime
    end
  end

  def down
    drop_table :cart_items
  end
end
