# encoding: utf-8

class ProductLineImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
    
  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    "/images/fallback/" + [version_name, "default.jpg"].compact.join('_')
  end
  
  # Process files as they are uploaded:
   process :convert => 'jpg'
   process :resize_to_limit => [1012, 728]

   # Create different versions of your uploaded files:  
   cattr_accessor :version_dimensions
   self.version_dimensions = {
     :small => [48, 48],
     :medium => [242,242],
     :large => [410, 410]
   }


   version :small do
     process :manualcrop
     process :resize_to_fit => self.version_dimensions[:small]
   end

   version :medium do
     process :manualcrop
     process :resize_to_fit => self.version_dimensions[:medium]
   end
   
   version :large do
     process :manualcrop
     process :resize_to_fit => self.version_dimensions[:large]
   end
  
   def manualcrop
     return unless model.cropping?
     return if model.crop_params[version_name.to_sym].blank?
     model.get_crop_version!(version_name)

     manipulate_crop! do |img|
       img.crop("#{model.crop_w.to_i}x#{model.crop_h.to_i}+#{model.crop_x.to_i}+#{model.crop_y.to_i}")
     end
   end

   def manipulate_crop!
     crop_image = ::MiniMagick::Image.open(current_path)
     yield(crop_image)
     crop_image.write(current_path)
   rescue => e
     raise CarrierWave::ProcessingError.new("Failed to manipulate with MiniMagick, maybe it is not an image? Original Error: #{e}")
   end

   # Add a white list of extensions which are allowed to be uploaded.
   # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end
end
