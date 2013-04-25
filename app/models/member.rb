class Member < ActiveRecord::Base
  has_many :posts
  belongs_to :department
  attr_accessible :biography, :description, :image, :name, :crop_x, :crop_y, :crop_w, :crop_h, :department_id
  validates :name, :description, :biography, :image, :department_id, :presence => true
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  mount_uploader :image, ImageUploader
  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
