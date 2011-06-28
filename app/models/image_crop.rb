module ImageCrop
  
  def self.included(base)
    base.class_eval "attr_accessor :crop_x, :crop_y, :crop_h, :crop_w"
    base.class_eval "after_update :reprocess_image, :if => :cropping?"
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def image_geometry
    img = MiniMagick::Image.open(self.image.current_path)
    @geometry = {:width => img[:width], :height => img[:height] }
  end

  private

  def reprocess_image
    self.image.recreate_versions!
  end

end
