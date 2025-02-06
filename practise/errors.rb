def div(x,y)
  x/y
rescue ZeroDivisionError => e
  e.full_message
end


begin
  # puts div(1,0)
  # puts div(4,'s')
  puts even_numbers([])
rescue => e
  puts "#{e.class}.#{e.message}.#{e.backtrace}"
end

class NoEvensError < StandardError
  # can extend it
  attr_reader :arr
  
  def initialize(arr=[])
    @arr = arr
    super("No even numbers in the array") #og class takes msg as argument
  end
end

def even_numbers(arr=[])
  unless arr.is_a?(Array)
    raise ArgumentError
  end

  if arr.length == 0
    raise StandardError.new("Length of the array cant be zero")
  end
  arr.find_all {|e| e.to_i % 2 == 0}
end



