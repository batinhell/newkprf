class Video < ActiveRecord::Base
  attr_accessible :description, :name, :url
  default_scope :order => 'created_at DESC'
end
