source 'http://rubygems.org' 
gem 'rails', '3.2.12'
gem 'rails-i18n'
#gem "compass", :git => "git://github.com/chriseppstein/compass.git"
gem "compass", "~> 0.12.2"
gem 'chunky_png' # compass HEAD uses this for sass sprites, but lacks dependency :(
gem "compass-960-plugin", :require => "ninesixty"

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

# Asset template engines

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'inherited_resources'
gem "cancan"
gem "slim-rails"
gem 'client_side_validations'
gem 'kaminari'
gem 'has_scope'
#gem 'redcarpet'
gem 'devise'
#gem 'tinymce-rails'
gem 'simple_form'
gem "nested_form", :git => "git://github.com/ryanb/nested_form.git"
gem "browser"
gem 'turbolinks'
#gem "twitter-bootstrap-rails"

# JavaScript runtime is required for Tails 3.1; this should work on Ubuntu
#gem 'therubyracer', '>= 0.8.2'
#gem "therubyracer"

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

gem 'rspec-rails', :group => [:development, :test] # rails generators needs rspec in :development
group :test do
  #gem 'autotest'
  #gem 'autotest-fsevent'
  #gem 'autotest-growl'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'remarkable_activerecord', '~> 4.0.0.alpha4'
  #gem 'ruby-fsevent'
  #gem 'watchr'
  #gem 'spork'
end




gem 'carrierwave'
gem 'mini_magick'



# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'




group :development do
  gem "rails-erd"
end

