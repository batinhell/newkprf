class Page < ActiveRecord::Base
  extend FriendlyId 
  friendly_id :title, use: :slugged
  attr_accessible :content, :title, :description, :parent_id, :url, :position
  validates_presence_of :title, :content, :description
  has_many :subpages, :class_name => 'Page', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Page', :foreign_key => 'parent_id'
  default_scope :order => 'position ASC'
  before_save :set_url

  private
    def set_url
      self.url = "pages/#{self.slug}" unless self.url.present?
    end

end
