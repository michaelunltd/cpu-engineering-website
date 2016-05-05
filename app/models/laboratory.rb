class Laboratory < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
