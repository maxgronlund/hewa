# encoding: utf-8


TextContent.create(:identity => "welcome" , :title => 'Velkommen til Hewa', :body => 'Lorem ipsum dolor sit amet')
TextContent.create(:identity => "footer_text" , :title => 'Footer tekst', :body => 'Hewa Health Care ApS • Roholmsvej 14A • 2620 Albertslund • Tel.: +45 3976 1140 • Fax: +45 3976 0140')
User.create(:email => "max@synthmax.dk" , :name => 'Max Grønlund', :password => 'rosalina', :role => 'super')

require File.expand_path('../product_line_seeds', __FILE__)
require File.expand_path('../product_seeds', __FILE__)
require File.expand_path('../product_title_seeds', __FILE__)
require File.expand_path('../price_seeds', __FILE__)
