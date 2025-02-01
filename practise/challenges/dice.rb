class DiceSet
  attr_accessor :dice_one, :dice_two

  def initialize
    roll_dices
    print_dice
  end

  def ask
    loop do
      puts "Enter r to roll again and q to quit"
      input = gets.chomp
      if input == "r"
        roll_dices
        print_dice
      else
        puts "Bye"
        break
      end
    end
  end

private
  def get_random
    rand(6)
  end

  def print_dice
    puts "[ #{dice_one} ] [ #{dice_two} ]"
  end

  def roll_dices
    @dice_one = get_random()
    @dice_two = get_random()
  end
end


dices = DiceSet.new
dices.ask