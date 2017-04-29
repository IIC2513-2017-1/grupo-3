class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :address
      t.string :password, null: false
      t.string :password_confirmation, null: false
      t.integer :points, default: 0
      t.string :phone
      t.string :gender
      t.date :birth_date

      t.timestamps
    end
  end
end
