class AddDishToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :dish, foreign_key: true
  end
end
