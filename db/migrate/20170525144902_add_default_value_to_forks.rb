class AddDefaultValueToForks < ActiveRecord::Migration[5.0]
  def up
  change_column :rates, :forks, :integer, :default => 0
  end
  def down
    change_column :rates, :forks, :integer, :default => nil
  end
end
