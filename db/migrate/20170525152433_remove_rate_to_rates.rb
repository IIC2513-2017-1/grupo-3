class RemoveRateToRates < ActiveRecord::Migration[5.0]
  def change
    remove_reference :rates, :rate, index: true, foreign_key: true
  end
end
