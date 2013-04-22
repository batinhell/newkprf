class Photo < ActiveRecord::Base
  attr_accessible :description, :image, :album_id
  belongs_to :album
  mount_uploader :image, PhotoUploader
end
