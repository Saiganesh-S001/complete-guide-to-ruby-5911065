#!/usr/bin/env ruby

require_relative 'classes/person'

p1 = Person.new({noise:"Nothing"})
p1.first_name = "Mike"
p1.last_name = "Tyson"

puts p1.say_name