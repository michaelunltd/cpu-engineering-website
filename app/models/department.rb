class Department < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
end
