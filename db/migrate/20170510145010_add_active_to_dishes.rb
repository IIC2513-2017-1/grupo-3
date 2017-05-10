class AddActiveToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :active, :boolean, default: true
  end
end
