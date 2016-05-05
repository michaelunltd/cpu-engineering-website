class Department < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  has_many :employees
  has_many :linkages
end
