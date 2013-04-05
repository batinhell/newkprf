class Agit < ActiveRecord::Base
  attr_accessible :description, :image, :name
  mount_uploader :image, AgitUploader
end
