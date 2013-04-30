class Banner < ActiveRecord::Base
  attr_accessible :image, :url
  mount_uploader :image, PhotoUploader
end
