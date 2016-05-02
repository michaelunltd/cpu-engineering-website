class Organization < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
end
