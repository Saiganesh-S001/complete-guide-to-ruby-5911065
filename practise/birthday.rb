require 'date'

puts "Year , Month, Date ?"
year = gets.chomp.to_i
month = gets.chomp.to_i
day = gets.chomp.to_i

birth_date = Date.new(year,month, day)

puts birth_date.yday, birth_date.wday, birth_date.leap?, birth_date.cweek # cweek - week of the year