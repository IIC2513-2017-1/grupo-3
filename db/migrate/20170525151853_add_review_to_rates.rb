class AddReviewToRates < ActiveRecord::Migration[5.0]
  def change
    add_reference :rates, :review, foreign_key: true
  end
end
