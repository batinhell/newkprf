class Document < ActiveRecord::Base
  attr_accessible :file, :name
  mount_uploader :file, AgitUploader
end
