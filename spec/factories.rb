require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'secret'
end

Factory.define :admin, :class => User do |u|
  u.name 'Test Admin User'
  u.email 'admin@test.com'
  u.password 'secret'
  u.role 'admin'
end

Factory.define :super, :class => User do |u|
  u.name 'Test Super User'
  u.email 'super@test.com'
  u.password 'secret'
  u.role 'super'
end
