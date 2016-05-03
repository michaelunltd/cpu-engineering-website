class Employee < ActiveRecord::Base
  mount_uploader :photo, ImageUploader

  def name
    [first_name, last_name].join ' '
  end
end
