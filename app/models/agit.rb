class Agit < ActiveRecord::Base
  attr_accessible :description, :image, :name, :file
  mount_uploader :image, AgitUploader
  mount_uploader :file, PhotoUploader
end
