def rps(human_choice)
  moves = ["Paper","Rock","Scissors"]
  computer_choice = computer_move
  if human_choice == moves[0]
    if computer_choice == moves[1]
      puts "#{computer_choice}, Win"
    elsif computer_choice == moves[2]
      puts "#{computer_choice}, Lose"
    else
      puts "#{computer_choice}, Draw"
    end

  elsif human_choice == moves[1]
    if computer_choice == moves[1]
      puts "#{computer_choice}, Draw"
    elsif computer_choice == moves[2]
      puts "#{computer_choice}, Win"
    else
      puts "#{computer_choice}, Lose"
    end

  else
    if computer_choice == moves[1]
      puts "#{computer_choice}, Lose"
    elsif computer_choice == moves[2]
      puts "#{computer_choice}, Draw"
    else
      puts "#{computer_choice}, Win"
    end
  end
end

def computer_move
  moves = ["Paper","Rock","Scissors"]
  moves[rand(3)]
end