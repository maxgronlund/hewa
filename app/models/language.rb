class Language

  def self.to_select
    {'Danmark' => 1, 'Sverige' => 2}
  end

  def self.id_from_locale
    case I18n.locale
    when :da
      1
    when :'sv-SE'
      2
    end
  end

end
