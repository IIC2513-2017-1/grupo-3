class DropTableRates < ActiveRecord::Migration[5.0]
  def up
    drop_table :rates
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
