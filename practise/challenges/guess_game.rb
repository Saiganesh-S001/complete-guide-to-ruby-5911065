puts "Hello!, whats ur name ? "
name = gets.chomp
puts "Nice to meet u, #{name} !"
puts "Let's start the game"

og_num = [*(1..10)].shuffle.first
turns = 0
MAX_TURNS = 3

while turns < MAX_TURNS
  guessed_num_string = gets
  guessed_num = guessed_num_string.chomp.to_i
  if guessed_num == og_num
    puts "Congrats, the number was #{og_num}"
    exit!
  elsif
    turns += 1
    puts "Oops, try again. U have #{MAX_TURNS - turns} turns left"
  end
end

puts "Bye!, the number was #{og_num}"