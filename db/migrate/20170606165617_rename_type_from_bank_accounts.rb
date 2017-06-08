class RenameTypeFromBankAccounts < ActiveRecord::Migration[5.0]
  def change
    rename_column :bank_accounts, :type, :account_type
  end
end
