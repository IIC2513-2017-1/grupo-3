class CreateCategorizings < ActiveRecord::Migration[5.0]
  def change
    create_table :categorizings do |t|
      t.belongs_to :dish, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
