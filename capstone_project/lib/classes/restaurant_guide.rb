require 'csv'
require_relative 'restaurant'

module RestaurantsFinder
  class RestaurantGuide
    @@file_name = 'restaurants.csv'

    def initialize
      @file_path = File.join(APP_ROOT, @@file_name)
      puts @file_path
      # check for existence of the file and usability of the file
      unless File.exist?(@file_path)
        create_file
      end

      # unless file_usable?
      #   raise "Storage file not usable"
      # end
    end

    def add 
      # Create a new instance of restaurant
      new_restaurant = Restaurant.add_restaurant

      # Add it to the csv file
      CSV.open(@file_path , 'a') do |csv|
        array_to_add = [new_restaurant.name, new_restaurant.cuisine, new_restaurant.price]
        csv << array_to_add
      end

    end

    def help
      puts "list: list all restaurants"
      puts "  Sortable by: name, cuisine, price"
      puts "  Example: 'list cuisine' or 'list by cuisine'"
      puts
      puts "find: find a restaurant using a keyword"
      puts "  Example: 'find mex' or 'find 25'"
      puts
      puts "add: add a new restaurant to the list"
      puts
    end

    def list(category = "name")
      # Get all the restaurants from the csv as array of restaurants
      restaurants = sort_restaurants(all_restaurants, category)
      output_listings(restaurants)
    end

    def find(keyword = "")
      restaurants = filter_restaurants(all_restaurants, keyword)
      output_listings(restaurants)
    end

    private 

    def create_file
      headers = ["Name", "Cuisine, Price"]
      initial_content = headers.join(',') + "\n"
      File.write(@file_path, initial_content)
    end

    def output_listings(restaurants)
      # Beautify this later
      div = " "
      print div + "Name"
      print div*3 + "Cuisine"
      print div + "Price"
      print "\n\n"

      restaurants.each do |r|
        print div + r.name
        print div+ r.cuisine
        print div + r.formatted_price
        print "\n\n"
      end
    end

    def all_restaurants
      restaurants = []

      CSV.foreach(@file_path, headers: true) do |row|
        name = row['Name']
        price = row['Price']
        cuisine = row['Cuisine']

        rest = RestaurantsFinder::Restaurant.new(name:name, price:price, cuisine:cuisine)
        restaurants << rest
      end
      restaurants
    end

    def sort_restaurants(restaurants, sort_by = "name")
      restaurants.sort do |r1, r2|
        case sort_by
        when 'name'
          r1.name.downcase <=> r2.name.downcase
        when 'cuisine'
          r1.cuisine.downcase <=> r2.cuisine.downcase
        when 'price'
          r1.price.to_i <=> r2.price.to_i
        end
      end
    end

    def filter_restaurants(restaurants, keyword = "")
      key = keyword.downcase
      restaurants.select do |r|
        r.name.downcase.include?(key) ||
        r.cuisine.downcase.include?(key) || 
        r.price.to_i <= key.to_i
      end
    end

    # checks for usability of the file
    def file_usable?
      return false unless File.readable?(@file_path)
      return false unless File.writable?(@file_path)
    end

    # def output_header(text)
  	#   puts "\n#{text.upcase.center(@@width)}\n\n"
  	# end

  end
end