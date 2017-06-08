class AddPendingToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :pending, :boolean, :default => true
  end
end
