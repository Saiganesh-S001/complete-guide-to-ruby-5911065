require_relative 'list_file'

module ListMaker
  class Controller

    @@valid_actions = ['view', 'add', 'edit', 'delete', 'quit']
    
    def initialize
      @list_file = ListMaker::ListFile.new
    end

    def launch!
      introduction
      # input/action loop
      loop do
        action, args = get_action
        break if action == 'quit'
        do_action(action, args)
      end
      conclusion
    end
    
    private
    
    def introduction
      puts "-" * 60
      puts "List Maker".upcase.center(60)
      puts "-" * 60
      puts "This is an interactive program for managing a list."
    end

    def conclusion
      puts
      puts "-" * 60
      puts "Goodbye!".upcase.center(60)
      puts "-" * 60
      puts
    end
  
    def get_action
      action = nil
      until @@valid_actions.include?(action)
        puts "\nActions: " + @@valid_actions.join(', ')
        print "> "
        response = gets.chomp
        # split response on spaces; first word is the action
        # any other strings are arguments to that action
        args = response.downcase.strip.split(' ')
        action = args.shift
      end
      [action, args]
    end
      
    def do_action(action, args)
      case action
      when 'view'
        @list_file.view
      when 'add'
        @list_file.add
      when 'edit'
        num = args.first || get_number
        @list_file.edit(num)
      when 'delete'
        num = args.first || get_number
        @list_file.delete(num)
      else
        puts "\nI don't understand that command.\n\n"
      end
    end

    def get_number
      print "\nWhicth number? "
      gets.chomp
    end

  end
  
end
