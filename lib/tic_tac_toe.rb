class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
#### pasted

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3
    # puts display_board(board)
    # puts win_combination
    # puts position_1, position_2, position_3
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") or
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination # return the win_combination indexes that won.
    end
  end
  return false
end

def full?
  ans = @board.all? do |cell|
    cell == "X" or cell == "O"
  end
  return ans
end

def draw?

  if !(won?)
    if full?
      return true
    else
      return false
    end
  else
    return false
  end
end

def over?
  if won? or full? or draw?
    return true
  else
    return false
  end
end

def winner
  if won?
    return @board[won?[0]]
  end
end

# Define display_board that accepts a board and prints
# out the current state.


def valid_move?(index)
  if !(index >=0) || !(index<=8)
    return false
  end
  if position_taken?(index)
    return false
  else
    return true
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(index)
  if (@board[index] == "") || (@board[index] == " ") || (@board[index] == nil)
    return false
  else
    return true
  end
end

def input_to_index(ind)
  ind = ind.to_i - 1
  return ind
end

def move(index, value)
  @board[index] = value
  return @board
end

def turn
  puts "Please enter 1-9:"
  move = gets.strip
  index = input_to_index(move)
  if valid_move?(index)
    @board = move(index, current_player)
    display_board
    return @board
  else
    turn
  end
end

def play
  while !(over?)
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
