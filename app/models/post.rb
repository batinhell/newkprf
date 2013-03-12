# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  attr_accessible :description, :title, :image
  mount_uploader :image, ImageUploader
  validates :title, :description, :image, :presence => true
end
