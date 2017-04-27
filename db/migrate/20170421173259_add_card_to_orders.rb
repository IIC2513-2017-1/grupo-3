class AddCardToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :card_number, :integer
  end
end
