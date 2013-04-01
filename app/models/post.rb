class Post < ActiveRecord::Base
  belongs_to :members
  attr_accessible :description, :title, :image, :in_slider, :crop_x, :crop_y, :crop_w, :crop_h, :member_id
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  mount_uploader :image, ImageUploader
  validates :title, :description, :image, :presence => true
  scope :slider, where(:in_slider => true).limit(3)


  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
