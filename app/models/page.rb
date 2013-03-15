class Page < ActiveRecord::Base
  include FriendlyId
  attr_accessible :content, :title, :description
  validates_presence_of :title, :content, :description
  friendly_id :title, :use => [:slugged, :simple_i18n]

end
