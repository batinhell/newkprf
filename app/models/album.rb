class Album < ActiveRecord::Base
  attr_accessible :description, :name, :photos_attributes
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  default_scope :order => 'created_at DESC'
end
