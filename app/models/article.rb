class Article < ActiveRecord::Base
  actable

  mount_uploader :image, ImageUploader

  def toggle!
    self.featured = !self.featured
    save
  end
end
