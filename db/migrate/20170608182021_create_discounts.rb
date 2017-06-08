class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.datetime :from_date
      t.datetime :to_date
      t.integer :discount_percent
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
