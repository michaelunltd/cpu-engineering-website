class Department < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  has_many :researches
end
