colors = "RRGGBBYYKK"

20.times do |i|
  arr = colors.split('')
  arr.push(arr.shift)
  colors = arr.join()
  puts colors
end