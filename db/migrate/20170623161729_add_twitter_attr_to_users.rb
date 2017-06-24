class AddTwitterAttrToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter_uid, :string
    add_column :users, :token, :string
    add_column :users, :secret, :string
    add_column :users, :provider, :string
  end
end
