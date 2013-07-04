
def adjacent_words(word, dictionary_file_name)

  dictionary_words = read_dict(dictionary_file_name)

  same_length_words = same_length_words(word, dictionary_words)

  valid_words = []
  word.length.times do |char1|
    same_length_words.each do |word2|
      same_char_count = [0] * word.length
      word2.length.times do |char2|
        if word[char1] == word2[char2]
          same_char_count[char1] = 1
        end

      end
      if same_char_count.count(1) == word.length - 1
        valid_words << word2
      end
    end
  end
  valid_words
end

def same_length_words(word, dictionary_words)
  valid_words = []
  dictionary_words.each do |dict_word|
    if word.length == dict_word.length
      valid_words << dict_word
    end
  end
  valid_words
end

def read_dict(file)
  lines = File.readlines(file)
  lines.each do |line|
    line.chomp!
  end
  lines
end

def find_chain(start_word, end_word, dictionary_file)
  current_words = [start_word].flatten
  p current_words
  new_words = []

  current_words.each do |word|
    adjacent_words(word, dictionary_file).each {|word| new_words << word unless current_word.include?(word)}
  end
  visited_words = []
  current_words.each do |words|
    visited_words << words
  end

  if new_words.include?(end_word)
    puts "YOU WIN"
  else
    find_chain(new_words, end_word, dictionary_file)
  end
  return "#{start_word}"
end




