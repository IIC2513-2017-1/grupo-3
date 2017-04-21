class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :final_price
      t.string :status
      t.boolean :tipping
      t.integer :tips
      t.string :payment_method
      t.time :delivery_time

      t.timestamps
    end
  end
end
