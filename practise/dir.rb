Dir.entries('.').each do |entry| # careful about the relative path
  #puts entry
  next if ['.', '..'].include?(entry)
  next if entry.start_with?('.')
  print "#{entry} : "
  puts File.file?(entry) ? 'file' : 'dir'
end