x = (1..10).find {|n| n % 3 == 0} # returns the first one it finds
x = (1..10).find_all {n| n % 3 == 0} # returns an array
x = (1..10).any? {|n| n < 5} # none, one, all 


nums = [*(1..20)]
nums.delete_if { |n| n <= 10} # deletes everything less than 10
 