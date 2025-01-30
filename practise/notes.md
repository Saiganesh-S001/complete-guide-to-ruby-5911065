### Integers

Numbers have methods like next, abs, .. Both float and integer originate from Numeric
Conversion : to_f, to_i (floor if there is float)

### Strings

to_s, to_i (can call on strings), capitalize, upcase, downcase, reverse(with bang, modifies the original object)
Every method returns an object. Interpolation is not possible in single quoted string. (#{})

- str.split('delimiter') -> returns an array

### Arrays

arr = [] and arr[5] = 10 works and array can have diff types of objects inside it.
arr[ind,len] , arr[f_ind..l_ind]

- arr.compact - removes empty positions
- arr.uniq - removes duplicate elements
- arr.include?(ele) - true or false
- arr.delete_at(ind) & arr.delete(ele)
- arr.flatten
- arr.join(<delimiter>)
- arr.first && arr.last
- arr.push(ele) && arr.pop
- arr.shift (deque) && arr.unshift(ele)

### Hash - hanging file folders

Order not important {key => value}
has_key?()
has_value?()

### Symbols

:name - memory save - has to do something with garbage collector
{sym_name : value} (no need of : infornt of sym_name)

### Booleans

![alt text](image.png)

### Ranges

inclusive ranges : [1..10] 1 to 10
exclusive ranges : [1...10] 1 to 9

range = 'a..z'
array = [*range] => \* splat operator - expands out the range to array

##### Constants

ALL_CAPS_ARE_CONSTANTS

### If and Unless

if product.visible?
end

unless product.sold_out?
end

unless cart.empty? # unless this stmt is true
end

### Iterators

![Iterators](image-1.png)

#### By class

![Iterators by class](image-2.png)
