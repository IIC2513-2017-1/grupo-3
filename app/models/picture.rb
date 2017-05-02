class Picture < ApplicationRecord
  # http://www.railscook.com/recipes/multiple-files-upload-with-nested-resource-using-paperclip-in-rails/
  belongs_to :dish

  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :image

end
