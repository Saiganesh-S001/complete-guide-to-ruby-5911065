require_relative 'restaurant_guide'

module RestaurantsFinder
  class Controller

    @@valid_actions = ['add','list','find','quit', 'help']

    def initialize
      @restaurant_guide = RestaurantsFinder::RestaurantGuide.new
    end

    def launch!
      loop do
        action, args = get_action
        if action == 'quit'
          break
        end
        execute(action,args)
      end
      puts "Bye!!"
    end

    def get_action
      action = nil
      until @@valid_actions.include?(action) 
        puts "\Actions : #{@@valid_actions.join(', ')}"
        response = gets.chomp
        args = response.strip.downcase.split(' ')
        action = args.shift
      end
      [action, args]
    end

    def execute(action, args = [])
      case action
      when 'add'
        @restaurant_guide.add
      when 'list'
        category = args.first
        if category 
          @restaurant_guide.list(category)
        else 
          @restaurant_guide.list
        end
      when 'find'
        keyword = args.first
        keyword = get_keyword if keyword.nil?
        @restaurant_guide.find(keyword)
      when 'help'
        @restaurant_guide.help
      else
        puts "\nI don't understand that command.\n\n"
      end
    end

    def get_keyword
      print "Enter a keyword: "
      gets.chomp
    end


  end
end