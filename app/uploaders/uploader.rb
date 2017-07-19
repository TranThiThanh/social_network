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
    "#{asset_host}/images/" +
      [version_name, "default.png"].compact.join("_")
  end

  version :thumb do
    process resize_to_fill: [Settings.max_thumb, Settings.max_thumb]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fill: [Settings.min_thumb, Settings.min_thumb]
  end

end
