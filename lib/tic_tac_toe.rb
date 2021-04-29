

class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end


WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def display_board
  row1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  row2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  row3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  divider = "-----------"
  puts row1
  puts divider
  puts row2
  puts divider
  puts row3
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(position, character)
  @board[position] = character
end

def position_taken?(index)
 @board[index] == "X" || @board[index] == "O"
end

def valid_move? (index)
index.between?(0, 8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  turn = 0
  @board.each do |marker|
    if marker == "X" || marker == "O"
      turn += 1
    end
  end
  turn
end

def current_player
 turnnumber = turn_count
 if turnnumber % 2 == 0
   "X"
 elsif turnnumber % 2 == 1
   "O"
 end
end


def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
  end
end



def full?
  @board.all? do |marker|
    marker == "X" || marker == "O"
  end
end

def draw?
  !won? && full?
end


def over?
  full? || won? && !full?
end

def winner
  if won? && WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
  position_1 == "X" && position_2 == "X" && position_3 == "X"
  end
  "X"
  elsif won?
  "O"
  end
end

def play
  until over? || draw?
    turn
  end
  if won? && winner == "X"
    puts "Congratulations X!"
  elsif won? && winner == "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
