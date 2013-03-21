class Member < ActiveRecord::Base
  attr_accessible :biography, :description, :image, :name
  mount_uploader :image, ImageUploader
  validates :name, :description, :biography, :image, :presence => true
end
