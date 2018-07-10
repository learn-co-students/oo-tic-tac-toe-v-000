class TicTacToe
  # assign instance var to @board
   def initialize
    @board = Array.new(9, " ")
    end
# win combination
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
# display_board 
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

# input_to_index 
def input_to_index(input)
   input.to_i - 1
end

# move
def move(index, current_player = "X")
   @board[index] = current_player
end

# valid_move? 
def valid_move?(board, index)
  if index < 0  || index > 8
    return false
  elsif board[index] == "X" || board[index] == "O"
    return false
  else
    true
  end
end

# position_taken? 
def position_taken?(index)
    if @board[index] == " "
    return false
    elsif @board[index] == "X" || @board[index] == "O" 
    return true 
 end
end
end