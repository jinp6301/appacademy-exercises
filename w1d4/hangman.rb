class HumanPlayer
  attr_reader :letter, :word_length, :blanks, :locations, :pre_location

  def initialize
    @pre_location = nil
  end

  def guess_letter
    print "Guess a letter"
    @letter = gets.chomp
  end

  def give_word_length
    print "How long is your word? "
    @word_length = gets.chomp.to_i
    @blanks = Array.new(@word_length, "-")
    @word_length

  end



  def show_blanks(letter)
    print "enter the location of correct letter as an array or X if not in word "
    @pre_location = gets.chomp
    if @pre_location != "x"
      @locations = @pre_location.split(",").map {|j| j.to_i }

      @locations.each do |i|
        @blanks[i] = letter
      end
    end

    @blanks
  end

end

class ComputerPlayer
  attr_reader :word, :words_of_correct_length, :most_common_letter, :new_word_list, :restrictions_removed_length_word_list

  def choose_word
    dictionary = File.readlines('dictionary.txt')
    dictionary.map!{|line| line.chomp}
    @word = dictionary[rand(dictionary.length)].split(//)
  end

  def get_word_list_length(word_length)
    dictionary = File.readlines('dictionary.txt')
    dictionary.map!{|line| line.chomp}
    @words_of_correct_length = dictionary.select {|word| word.length == word_length }
  end

  def comp_guess(length_word_list, played_letters, index, correct_played_letters)

    removed_length_word_list = remove_illegal_words(length_word_list, played_letters[-1])



    @restrictions_removed_length_word_list = get_word_list_restrictions(removed_length_word_list, correct_played_letters[-1], index)

    all_played_letters = played_letters | correct_played_letters
    common_letters(@restrictions_removed_length_word_list, all_played_letters)

  end

  def common_letters(word_list, used_letters)
    all_letters = word_list.join.split(//)
    all_letters_hash = Hash[all_letters.group_by {|w| w}.map {|w, ws| [w, ws.length]}]
    sorted_all_letters_hash = Hash[all_letters_hash.sort_by{ |key, value| value }.to_a.reverse]

    used_letters.each do |letter|
      if sorted_all_letters_hash.include?(letter)
        sorted_all_letters_hash.delete(letter)
      end
    end

    @most_common_letter = sorted_all_letters_hash.to_a[0][0]
    p @most_common_letter

  end

  def remove_illegal_words(word_list, letter)
    new_word_list = []

    unless letter.nil?
        word_list.each do |word|
         new_word_list << word unless word.include? letter
       end
   else
     new_word_list = word_list
   end
   new_word_list.uniq
  end

  def get_word_list_restrictions(words_of_correct_length, letter, index)
    if index.is_a? Integer
      index = [index]
    end

    unless index.nil? || letter.nil?
      word_list_with_restrictions = []
      index.each do |i|
        inner_word_list_with_restrictions = []
        words_of_correct_length.each do |word|
          if word[i] == letter
            inner_word_list_with_restrictions << word
          end
        end
        word_list_with_restrictions << inner_word_list_with_restrictions
      end

      return word_list_with_restrictions.inject(:&)
    else
      return words_of_correct_length
    end
  end

end

class Hangman

  def initialize(mode)
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
    if mode == 1
      @word = @computer.choose_word
    else
      @given_word_length = @human.give_word_length
    end
  end

  def show_blanks
    @blanks = []
    @word.length.times do |char|
      @blanks << '-'
    end
    puts @blanks.join
  end

  def new_guess
    @letter = @human.guess_letter
  end

  def check_win
    if @blanks == @word
      puts "you win!"
      return true
    end
    false
  end

  def update_blanks
    guessed_correct =  @word.each_index.select{|i| @word[i] == @letter}
    if guessed_correct.empty?
      puts @blanks.join
    else
      guessed_correct.each do |guess|
        @blanks[guess] = @letter
      end
    end
    puts @blanks.join
  end

  def play_computer
    show_blanks
    played_letters = []
    until check_win == true
      new_guess

      update_blanks

    end

  end

  def play_human
    @incorrect_played_letters = []
    @correct_played_letters = []
    @length_word_list = @computer.get_word_list_length(@given_word_length)


    while @human.blanks.include?("-")
      guessed_letter = @computer.comp_guess(@length_word_list, @incorrect_played_letters, @human.locations, @correct_played_letters)

      @human.show_blanks(guessed_letter)
      @length_word_list = @computer.restrictions_removed_length_word_list
      if @human.pre_location == 'x'
        @incorrect_played_letters << guessed_letter
      else
        @correct_played_letters << guessed_letter
      end


    end
    puts @human.blanks.join
    puts "you won!"

  end
end