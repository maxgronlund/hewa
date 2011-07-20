# Load the rails application
require File.expand_path('../application', __FILE__)

# Temporary fix for Rails-I18n Redish JSON decode error
require File.expand_path('../../lib/rails-1499-monkey-patch.rb', __FILE__)

# Initialize the rails application
RailsTemplateR31::Application.initialize!


#ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
#  "<span class='field_error'>#{html_tag}</span>"
#end

