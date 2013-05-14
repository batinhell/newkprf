class Post < ActiveRecord::Base
  extend FriendlyId 
  friendly_id :title, use: :slugged
  belongs_to :members, :class_name => 'Member', :foreign_key => 'member_id'
  belongs_to :albums, :class_name => 'Album', :foreign_key => 'album_id'
  attr_accessible :description, :title, :image, :in_slider, :crop_x, :crop_y, :crop_w, :crop_h, :member_id, :ruso, :rus_lad, :video, :album_id
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  mount_uploader :image, ImageUploader
  validates :title, :description, :image, :presence => true
  scope :slider, where(:in_slider => true).limit(3)
  include ActionView::Helpers::TextHelper
  default_scope :order => 'created_at DESC'

  def crop_image
    image.recreate_versions! if crop_x.present?
  end

  def mk_description
    simple_format(self.description)
  end

  def self.search(search)
    if search
      where 'title LIKE :search OR description LIKE :search', :search => "%#{search}%"
    else
      scoped
    end
  end

end
