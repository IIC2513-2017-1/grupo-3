class AddUpdatedAtToCartItems < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :updated_at, :datetime, :null => false
    change_column_null :cart_items, :created_at, false
  end
end
