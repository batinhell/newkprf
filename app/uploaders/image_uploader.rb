class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    resize_to_limit(600, 600)
  end

  version :slider do
    resize_to_fill(300, 220)
  end

  version :member do
    resize_to_fill(150, 200)
  end

  version :thumb do
    process :crop
    resize_to_fill(100, 100)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def crop
    if model.crop_x.present?
      resize_to_limit(600, 600)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end

end
