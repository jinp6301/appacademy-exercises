def initialize_board
  board = [
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0]
  ]
end

def cross_out_all(x,y,board)
  cross_out_straight(x,y,board)
  cross_out_diagonal(x,y,board)
end
def cross_out_straight(x,y,board)
  for a in 0...8
    board[x][a] = 1
    board[a][y] = 1
  end
  board[x][y] = 2
  board
end

def cross_out_diagonal(x,y, board)
  x_temp = x
  y_temp = y

  while x_temp >= 0 && y_temp >= 0
    board[x_temp][y_temp] = 1
    x_temp = x_temp - 1
    y_temp = y_temp - 1
  end
  x_temp = x
  y_temp = y
  while x_temp < 8 && y_temp >= 0
    board[x_temp][y_temp] = 1
    x_temp = x_temp + 1
    y_temp = y_temp - 1
  end
  x_temp = x
  y_temp = y
  while x_temp >= 0 && y_temp < 8
    board[x_temp][y_temp] = 1
    x_temp = x_temp - 1
    y_temp = y_temp + 1
  end
  x_temp = x
  y_temp = y
  while x_temp < 8 && y_temp < 8
    board[x_temp][y_temp] = 1
    x_temp = x_temp + 1
    y_temp = y_temp + 1
  end
  board[x][y] = 2
  board
end
def find_next(board)

  8.times do |x|
    8.times do |y|
      if board[x][y] == 0
        return [x,y]
        break
      end
    end
  end

end


