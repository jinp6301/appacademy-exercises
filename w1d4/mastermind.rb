class HumanPlayer

  def initialize
  end

  def get_input
    print "Enter your move of four colors (r,g,b,y,o,p)  "
    human_input = gets.chomp.split(//).to_a
    human_input_sym = human_input.map {|a| a.to_sym}
  end

end

class Mastermind

  def initialize
    @turns = 0
  end

  def new_game
    color_array = [:r,:g,:b,:y,:o,:p]
    @human = HumanPlayer.new
    @winning_combo = color_array.shuffle[0...4]
  end

  def check_win(human_input=[0,0,0,0])
    if human_input == @winning_combo
      puts "YOU WIN"
      return true
    end
    false
  end

  def show_board(human_input, total_correct)
    puts "#{human_input[0]} | #{human_input[1]} | #{human_input[2]} | #{human_input[3]}"
    puts "Correct Location AND Color #{total_correct[0]} | Correct Color but Incorrect Location #{total_correct[1]}"
    puts "Number of Turns #{@turns}"
  end



  def check_correct(winning_combo, human_input)
    check_loc_color = []

    winning_combo.count.times do |index|
      if winning_combo[index] == human_input[index]
        check_loc_color << 1
      else
        check_loc_color << 0
      end
    end

    check_loc_color_copy = []
    human_input_copy = []

    check_loc_color.count.times do |i|
      if check_loc_color[i] == 0
        check_loc_color_copy[i] = winning_combo[i]
        human_input_copy[i] = human_input[i]
      else
        check_loc_color_copy[i] = 0
        human_input_copy[i] = 1
      end
    end

    correct_color_count = 0

    human_input_copy.each do |human_color|
      if check_loc_color_copy.include?(human_color)
        correct_color_count += 1
      end
    end

    correct_color_loc_count = check_loc_color.inject(:+)
    total_correct = [correct_color_loc_count, correct_color_count]
  end

  def run
    new_game
    p @winning_combo
    test = @human.get_input
    until check_win(test) == true || @turns == 10
      @turns += 1


      total_correct = check_correct(@winning_combo, test)
      show_board(test, total_correct)
      test = @human.get_input
    end
    p "Congrats"
  end


end