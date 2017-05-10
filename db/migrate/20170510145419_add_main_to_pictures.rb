class AddMainToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :main_image, :boolean, default: false
  end
end
