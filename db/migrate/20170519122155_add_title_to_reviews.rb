class AddTitleToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :title, :string
    rename_column :reviews, :review, :body
  end
end
