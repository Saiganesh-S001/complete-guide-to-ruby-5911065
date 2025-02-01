VOWELS = ['a', 'e', 'i', 'o', 'u']

def find_vowel_in_array(arr = [])
  arr.find_index { |ele| VOWELS.include?(ele) }
end

def pig_latin(word = "")

  word.downcase! # Converting the word into downcase

  cons_cluster = ""
  word.each_char do |letter|
    if VOWELS.include?(letter)
      break
    else
      cons_cluster << word[0]
      word = word[1..-1]
    end
  end
  word + cons_cluster + "ay"
end

def pig_latin_arr(word = "")
  word.downcase!  
  char_arr = word.split('')
  first_vowel_pos = find_vowel_in_array(char_arr)

  if first_vowel_pos.to_i > 0
    front_str = char_arr[0...first_vowel_pos]
    main_str = char_arr[first_vowel_pos..-1]
  else
    front_str = []
    main_str = char_arr
  end
  main_str.join + front_str.join + "ay"
end



words = ['pig', 'latin', 'elevator', 'glove', 'where', 'Ruby']

words.each do |word|
  puts pig_latin(word)
end