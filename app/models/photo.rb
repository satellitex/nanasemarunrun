class Photo < ActiveRecord::Base
  belongs_to :room
  
  mount_uploader :image, ImageUploader
end
