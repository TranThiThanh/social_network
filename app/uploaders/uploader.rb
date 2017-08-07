class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [Settings.image_maximum, Settings.image_maximum]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    "/assets/" + [version_name, "default.png"].compact.join('_')
  end

end
