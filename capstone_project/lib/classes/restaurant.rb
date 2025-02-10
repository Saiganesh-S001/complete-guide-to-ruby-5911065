require_relative '../helpers/number_helper'
module RestaurantsFinder
  class Restaurant
    include NumberHelper
    attr_accessor :name, :price, :cuisine

    def initialize(args = {})
      @name = args[:name] || ''
      @cuisine = args[:cuisine] || ""
      @price   = args[:price]   || ""
    end

    def self.add_restaurant # Class method
      args = {}
      print "Restaurant name: "
      args[:name] = gets.chomp.strip

      print "Cuisine type: "
      args[:cuisine] = gets.chomp.strip

      print "Average price: $"
      args[:price] = gets.chomp.strip.delete('$')

      self.new(args)
    end

    def formatted_price
      number_to_currency(price)
    end
  end
end