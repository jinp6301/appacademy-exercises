class HumanPlayer
  def initialize
  end

  def human_move
    puts "Enter row"
    row = gets.chomp.to_i
    puts "Enter column"
    column = gets.chomp.to_i
    move = [row,column]
  end
end

class ComputerPlayer

  def make_best_move(board, turn)
    if turn == 0
      sum = 2
    else
      sum = 10
    end
    optimal_move = winning_index(board, sum)
    if optimal_move != nil
      return optimal_move
    else
      return find_open_spaces(board)
    end
  end

  def find_open_spaces(board)
    open_spaces=[]
    for i in 0...board.length
      for j in 0...board[1].length
        open_spaces << [i,j] if board[i][j] == 0
      end
    end
    open_spaces.shuffle.pop
  end

  def winning_index(board, sum)
    winning_move_index = []
    winning_move_index << winning_row(board,sum) unless winning_row(board,sum) == nil
    winning_move_index << winning_column(board,sum) unless winning_column(board,sum) == nil
    winning_move_index << winning_diagonal(board,sum) unless winning_diagonal(board,sum) == nil

    p winning_move_index
    win_move = winning_move_index.pop
    return win_move
  end

  def winning_row(board,sum)
    j = 0
    while j < 3
      if board[j].inject(:+) == sum
        return [j, board[j].index(0)]
      end
      j += 1
    end
  end

  def winning_column(board,sum)
    i = 0
    while i < 3
      column_sum = board[1][i] + board[2][i] + board[0][i]
      j = 0
      while j < 3
        if column_sum == sum && board[j][i] == 0
          return [j, i]
        end
        j += 1
      end
      i += 1
    end
  end

  def winning_diagonal(board,sum)
    diagonal1 = [board[1][1], board[0][0], board[2][2]]
    diagonal1index = [[1,1],[0,0],[2,2]]
    diagonal2 = [board[0][2], board[1][1], board[2][0]]
    diagonal2index = [[0,2],[1,1],[2,0]]

    if diagonal1.inject(:+) == sum
      return diagonal1index[diagonal1.index(0)]
     end
    if diagonal2 == sum
      return diagonal2index[diagonal2.index(0)]
    end
  end

end

class TicTacToe
  def initialize
    @board = [
    [0,0,0],
    [0,0,0],
    [0,0,0]
    ]
    @players = []

  end

  def board_display
    puts ''
    i = 0
    while i < 3
      puts "#{@board[i][0]}#{@board[i][1]}#{@board[i][2]}"
      i += 1
    end
    puts ''
  end

  def run(turn_tracker = 0)
    board_display
    legal_move = make_move(@players[turn_tracker],turn_tracker)
    if legal_move == nil
      draw_game
    else
      turn_tracker = (turn_tracker + 1) % 2
      check_win ? win(turn_tracker) : run(turn_tracker)
    end
  end

  def win(turn_tracker)
    puts "Player #{(turn_tracker+1)%2} WINS!"
  end

  def find_open_spaces
    open_spaces=[]
    for i in 0...@board.length
      for j in 0...@board[1].length
        open_spaces << [i,j] if @board[i][j] == 0
      end
    end
    open_spaces.shuffle.pop
  end

  def check_win
    truth_value = false
    @board.each do |row|
      if row.inject(:+) == 3 || row.inject(:+) == 15
        truth_value = true
      end
    end

    i = 0
    while i < 3
      column_sum = @board[1][i] + @board[2][i] + @board[0][i]
      if column_sum == 3 || column_sum == 15
        truth_value = true
      end

      i += 1
    end

    diagonal1 = @board[1][1] + @board[0][0] + @board[2][2]
    diagonal2 = @board[0][2] + @board[1][1] + @board[2][0]

    if diagonal1 == 3 || diagonal1 == 15
      truth_value = true
     end
    if diagonal2 == 3 || diagonal2 == 15
      truth_value = true
    end

    truth_value
  end

  def choose_players
    puts "How many human players? (0, 1, 2)"
    human_players = gets.chomp.to_i

    human_players.times do
      @players << HumanPlayer.new
    end

    (2-human_players).times do
      @players << ComputerPlayer.new
    end

  end

  def make_move(player, turn)
    if player.is_a? HumanPlayer

      if find_open_spaces == nil
        return nil
      end

      move = player.human_move
      row = move[0]
      column = move[1]

      if check_move_legal(row, column)
        turn == 0 ? @board[row][column] = 1 :  @board[row][column] = 5
      else
        puts "You suck"
        make_move(player, turn)
      end

    else
      move = player.make_best_move(@board, turn)
      if move != nil
        row = move[0]
        column = move[1]
        turn == 0 ? @board[row][column] = 1 :  @board[row][column] = 5
      else
        draw_game
      end
    end

    true

  end

  def draw_game
    board_display
    puts "DRAW! GAME OVER."
  end

  def check_move_legal(x,y)
    @board[x][y] == 0
  end

end