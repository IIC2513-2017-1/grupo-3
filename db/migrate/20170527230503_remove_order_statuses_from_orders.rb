class RemoveOrderStatusesFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_index :orders, :order_status_id
    remove_column :orders, :order_status_id, :integer
  end
end
