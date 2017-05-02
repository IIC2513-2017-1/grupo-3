class AddSealToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :seal, :boolean
  end
end
