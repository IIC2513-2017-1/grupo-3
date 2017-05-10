class ChangeTypeFromOrders < ActiveRecord::Migration[5.0]

  def self.up
   change_column :orders, :final_price, :decimal, precision: 12, scale: 3
   change_column :orders, :tips, :decimal, precision: 12, scale: 3
  end
  def self.down
   change_column :orders, :final_price, :integer
   change_column :orders, :tips, :integer
  end
end
