class Member < ActiveRecord::Base
  has_many :posts
  attr_accessible :biography, :description, :image, :name, :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :image, ImageUploader
  validates :name, :description, :biography, :image, :presence => true
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
