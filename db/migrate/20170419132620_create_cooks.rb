class CreateCooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cooks do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :visible, default: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :password_confirmation, null: false
      t.string :address, null: false
      t.float :score, default: 0
      t.string :phone
      t.string :gender
      t.boolean :seal
      t.date :birth_date
      t.timestamps
    end
  end
end
