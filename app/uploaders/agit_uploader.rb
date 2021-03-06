class AgitUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(zip rar)
  # end

end
