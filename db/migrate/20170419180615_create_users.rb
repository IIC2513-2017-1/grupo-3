class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :password
      t.string :password_confirmation
      t.integer :points
      t.string :phone
      t.string :gender
      t.date :birth_date

      t.timestamps
    end
  end
end
