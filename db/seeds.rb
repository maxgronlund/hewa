# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#TextContent.create(:identity => "welcome" , :title => 'Velkommen til Hewa', :body => 'Lorem ipsum dolor sit amet')
TextContent.create(:identity => "footer_text" , :title => 'Footer tekst', :body => 'Hewa Health Care ApS • Roholmsvej 14A • 2620 Albertslund • Tel.: +45 3976 1140 • Fax: +45 3976 0140')
#User.create(:email => "max@synthmax.dk" , :name => 'Max Grønlund', :password => 'rosalina', :role => 'super')