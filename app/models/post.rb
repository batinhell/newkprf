# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  attr_accessible :description, :title, :image, :in_slider
  mount_uploader :image, ImageUploader
  validates :title, :description, :image, :presence => true

  scope :slider, where(:in_slider => true).limit(3)
end
