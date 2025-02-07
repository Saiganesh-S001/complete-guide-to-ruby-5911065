module ListMaker
  class ListFile

    @@file_name = 'list_data.txt'

    def initialize
      @file_path = File.join(APP_ROOT,@@file_name)
      if File.exist?(@file_path)
        if !File.readable?(@file_path)
          abort("The file is not readable")
        elsif !File.writable?(@file_path)
          abort("The file is not writable")
        end
      else
        File.write(@file_path,'')
        if !File.exist?(@file_path)
          abort("List file does not exist and could not be created.")
        end
      end
      self
    end
    
    def view
      # puts File.read(@file_path)
      File.open(@file_path, 'r') do |file|
        file.each_line do |line|
          puts "#{file.lineno} : #{line}"
        end
        if file.lineno == 0
          puts "<< The file is empty >>"
        end
      end
    end

    def add
      puts "Enter the new list item and hit return."
      user_input = gets
      File.open(@file_path ,'a') {|file| file << user_input}
      puts "List item added."
    end

    def edit(pos)
      ind = pos.to_i - 1
      lines = File.readlines(@file_path)
      curr_line = lines[ind]
      if curr_line == nil
        puts "Invalid position!"
        return
      end
      puts "Enter the new text and hit return."
      puts "#{pos}: #{curr_line}"
      user_input = gets
      lines[ind] = user_input
      File.write(@file_path, lines.join)
      puts "List item #{pos} updated"
    end

    def delete(pos)
      ind = pos.to_i - 1
      lines = File.readlines(@file_path)
      curr_line = lines[ind]
      if curr_line == nil
        puts "Invalid position!"
        return
      end
      lines.delete_at(ind)
      data = lines.join
      File.write(@file_path,data)
      puts "List item deleted"
    end
  end
end