i = 0
while i < 10 # loops until the condition is true
  puts "i : #{i}"
  i += 1
end

until i > 20 # loops until the condition is false
  puts "i : #{i}"
  i += 1
end

loop do
  break if i > 30
  puts "for i : #{i}"
  i += 1
end

##app

cart = ['a','b','c']

until cart.empty?
  puts cart.shift.upcase
end