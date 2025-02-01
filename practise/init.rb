#!/usr/bin/env ruby

require_relative 'classes/person'
require_relative 'classes/product'
require_relative 'classes/animal'

p1 = Person.new(noise:"Nothing")
p1.first_name = "Mike"
p1.last_name = "Tyson"

puts p1.say_name

ring = Product.exclusive #factory method
puts sprintf("$%.2f", ring.price) # $35.10

another_prod = Product.new(10.0)
puts another_prod

puts Product::product_count ## Error ,can't access class variables directly, there should a method for this.

Animal.new.sleep

class Cow < Animal
  def initialize
    self.noise = 'Moo!'
    self.color = 'brown'
  end
end

cow = Cow.new
puts cow.noise, cow.sleep