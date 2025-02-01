Vowels = ['a', 'e', 'i', 'o', 'u']

def pig_latin(word)
  cons_cluster = ""
  word.each_char do |letter|
    if Vowels.include?(letter)
      break
    else
      cons_cluster << word[0]
      word = word[1..-1]
    end
  end
  word << cons_cluster
  word << "ay"
  puts word
end

words = ["iglue", "happy" , "hgappy"]

words.each do |word|
  pig_latin(word)
end