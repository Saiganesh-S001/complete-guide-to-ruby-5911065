# puts File.dirname(__FILE__), File.expand_path(__FILE__), __FILE__, __dir__ # relative dir, absolute path, relative path, abs dir

# puts "This file (relative): " + __FILE__
# puts "This file (absolute): " + File.expand_path(__FILE__)
# puts 

# puts "This dir (relative): " + File.dirname(__FILE__)
# puts "This dir (absolute): " + File.expand_path(File.dirname(__FILE__))
# puts "This dir (absolute): " + __dir__
# puts


file = File.new("text.txt",'w')

file.puts "New item"
file.write "+ second item\n"
file << "+ third item\n"


file.close

File.open("text.txt", 'r') do |file|
   file.read(4) # reads 4 chars
   line1 = file.gets.chomp
   line2 = file.gets.chomp unless file.eof?
   puts line1,line2

   file.each_line do |line|
    puts line.chomp.reverse
   end
end
