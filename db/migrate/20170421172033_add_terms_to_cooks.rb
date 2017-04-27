class AddTermsToCooks < ActiveRecord::Migration[5.0]
  def change
    add_column :cooks, :terms_of_service, :boolean
  end
end
