class TicTacToe
def initialize(board = [" "," "," "," "," "," "," "," "," "])
  @board = board
end

def board=(board)
  @board = board
end

def board
  @board
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [0,3,6],
  [2,4,6]
]

def input_to_index(user_input)
   index = user_input.to_i - 1
end

def move(index, char)
@board[index] = char
end

def position_taken?(board, index)
taken = nil
if (board[index] ==  " " || board[index] == "" || board[index] == nil)
taken = false
else
taken = true
end

end
