class AddAttributesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :customer_email, :string
    add_column :orders, :customer_phone_number, :string
    # Shipping Address
    add_column :orders, :deliver_to_first_name, :string
    add_column :orders, :deliver_to_last_name, :string
    add_column :orders, :deliver_to_address, :string
    # Private parts
    add_column :orders, :customer_ip, :string
    remove_column :orders, :card_number, :integer
  end
end
