class AddAvatarsToDishes < ActiveRecord::Migration[5.0]
  def change
  end
  def self.up
    change_table :dishes do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :dishes, :avatar
  end
end

# http://www.peoplecancode.com/es/tutorials/users-avatars-uploading-images-using-paperclip
