require_relative 'list_file'

module ListMaker
  class Controller

    @@valid_actions = ['add','view','edit','delete','quit']

    def initialize
      @list_file = ListMaker::ListFile.new
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

    def execute(action, args)
      case action
      when 'add'
        @list_file.add
      when 'view'
        @list_file.view
      when 'edit'
        todo_num = args.first || get_num
        @list_file.edit(todo_num)
      when 'delete'
        todo_num = args.first || get_num
        @list_file.delete(todo_num)
      else
        puts "\nI don't understand that command.\n\n"
      end
    end

    def get_num
      print "\nWhich number? "
      gets.chomp
    end


  end
end