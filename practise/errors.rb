def div(x,y)
  x/y
rescue ZeroDivisionError => e
  e.full_message
end


begin
  puts div(1,0)
  puts div(4,'s')
rescue => e
  puts "#{e.class}.#{e.message}.#{e.backtrace}"
end