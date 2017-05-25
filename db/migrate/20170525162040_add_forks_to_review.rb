class AddForksToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :forks, :integer, default: 0
  end
end
