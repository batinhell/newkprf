class Department < ActiveRecord::Base
  has_many :members
  attr_accessible :name
end
