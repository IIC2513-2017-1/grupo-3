class AddStatusToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :status, :string, default: 'pending'
  end
end
