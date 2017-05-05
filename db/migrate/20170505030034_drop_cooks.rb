class DropCooks < ActiveRecord::Migration[5.0]
  def down
    drop_table :cooks
  end
end
