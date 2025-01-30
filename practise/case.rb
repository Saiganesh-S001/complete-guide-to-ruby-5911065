count = 0

case count
when 0
  puts "Zero"
when 1
  puts "One"
when 2..6
  puts "Few"
else 
  puts "Too many"
end


DEFAULT_LIMIT = 100
default ||= DEFAULT_LIMIT

puts default