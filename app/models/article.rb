class Article < ActiveRecord::Base
  actable

  mount_uploader :image, ImageUploader

  # toggles the articles featured attribute
  def toggle!
    self.featured = !self.featured
    save
  end
end
