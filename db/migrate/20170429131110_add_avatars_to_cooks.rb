class AddAvatarsToCooks < ActiveRecord::Migration[5.0]
  def self.up
    change_table :cooks do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :cooks, :avatar
  end
end
