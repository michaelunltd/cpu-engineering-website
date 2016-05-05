class Research < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :department
end
