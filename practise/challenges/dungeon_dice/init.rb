require_relative 'classes/dice'
require_relative 'classes/dice_four'
require_relative 'classes/dice_eight'
require_relative 'classes/dice_ten'

dice_sizes = {
  4 => FourDice.new,
  6 => Dice.new,
  8 => EightDice.new,
  10 => TenDice.new,
}

def status(dice)
  "Dice #{dice.sides}: #{dice.display}"
end

dice = Dice.new
puts status(dice)

input = nil

until input == 'q'
  puts "Type 'r' to roll, 'c' to change size, 'q' to quit"
  input = gets.chomp

  if input == 'c'
    puts "\nAvailable sizes: #{dice_sizes.keys.join(', ')}"
    new_size = gets.chomp
    new_dice = dice_sizes[new_size.to_i]
    if new_dice.nil?
      puts "Invalid size"
    else
      dice = new_dice
      dice.roll
      puts status(dice)
    end
  elsif input == 'r'
    dice.roll
    puts status(dice)
  end
end