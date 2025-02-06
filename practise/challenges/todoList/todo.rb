module LIL
  class ToDoList
    include Enumerable 

    def initialize(options = {})
      @items = options[:todo]
    end

    def each
      @items.each { |item| yield(item)} #have to be there if ur using enumerable
    end

    def last 
      @items[-1]
    end

    def <<(item) # add item to the beginning of the list
      @items.unshift(item)
    end
  end
end


list = LIL::ToDoList.new(todo:[1,2,3,4,5])
puts list.count, list.first, list.find {|i| i < 3 }
puts "-----"
puts list << 6, list.count
puts list.map {|i| i+1}