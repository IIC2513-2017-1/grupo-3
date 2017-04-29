class CreateCooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cooks do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :visible
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :address
      t.float :score
      t.string :phone
      t.string :gender
      t.boolean :seal
      t.date :birth_date
      t.timestamps
    end
  end
end