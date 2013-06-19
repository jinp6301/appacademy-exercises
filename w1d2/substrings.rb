def substrings(word)
  i = 0
  substring_array = []
  while i <= word.length
    j = i
    while j < word.length
      substring_array << word[i..j]
      j += 1
    end
    i += 1
  end
  substring_array
end

def subwords(word)
  word_substrings = substrings(word)
  word_subwords = []
  dictionary = []

  File.foreach("2of12inf.txt") do |line|
    dictionary << line.chomp
  end

  word_substrings.each do |word_substring|
    word_subwords << word_substring if dictionary.include?(word_substring)
  end

  word_subwords
end