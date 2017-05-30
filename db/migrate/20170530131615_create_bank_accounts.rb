class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.references :user, index: true, foreign_key: {on_delete: :cascade}
      t.string :type, null: false
      t.string :account,  null: false
      t.string :bank, null: false
      t.string :id_card_number, null: false
      t.timestamps
    end
  end
end
