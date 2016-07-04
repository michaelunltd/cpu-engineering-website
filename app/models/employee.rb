class Employee < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
  belongs_to :department

  def name
    "#{honorifics} #{first_name} #{middle_name[0,1]}. #{last_name}"
  end
end
