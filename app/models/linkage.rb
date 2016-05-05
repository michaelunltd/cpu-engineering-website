class Linkage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :department
end
