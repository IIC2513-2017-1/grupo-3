class ChangeActiveFromDishes < ActiveRecord::Migration[5.0]
  def up
    change_column_default :dishes, :active, true
  end
  def down
    change_column_default :dishes, :active, nil
  end
end
