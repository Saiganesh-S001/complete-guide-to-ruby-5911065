
require_relative 'lib/classes/controller'
APP_ROOT = File.expand_path(File.dirname(__FILE__))

# Ruby program to find the restaurants
# Restaurants stored in csv (Name, Cuisine, Price)
# Actions : list (name - sort), find, add, help, quit

begin
  @controller = RestaurantsFinder::Controller.new
  @controller.launch!
rescue => e
  puts "An error occured!"
  puts e.message
end 
