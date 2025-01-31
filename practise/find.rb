x = (1..10).find {|n| n % 3 == 0} # returns the first one it finds
x = (1..10).find_all {|n| n % 3 == 0} # returns an array
x = (1..10).any? {|n| n < 5} # none, one, all 


nums = [*(1..20)]
nums.delete_if { |n| n <= 10} # deletes everything less than 10
 
hash = {a:1, b: 2, c: 3}
puts hash.sort {|p1 , p2| p2[1] <=> p1[1]} # returns array


h1 = { :a=> 1, :b=>2, :c => 5}
h2 = { :a=> 2, :b=> 3, :d => 6}

puts h1.merge(h2) { |k,o,n| [o,n]}
