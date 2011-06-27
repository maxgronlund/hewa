module ImageCrop
  
  def self.included(base)
    base.class_eval "attr_accessor :crop_x, :crop_y, :crop_h, :crop_w"
    base.class_eval "after_update :reprocess_profile, :if => :cropping?"
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def profile_geometry
    img = Magick::Image::read(self.profile_url).first
    @geometry = {:width => img.columns, :height => img.rows }
  end

  private

  def reprocess_profile
    self.image.recreate_versions!
  end

end
