class Page < ActiveRecord::Base
  include FriendlyId
  attr_accessible :content, :title, :description, :parent_id
  validates_presence_of :title, :content, :description
  friendly_id :title, :use => [:slugged, :simple_i18n]
  has_many :subpages, :class_name => 'Page', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Page', :foreign_key => 'parent_id'

end
