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

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  i = gets.strip
  index = input_to_index(i)
  m = valid_move?(index)
  if m == true
    move(index, current_player)
  else m == false
    until m == true
      puts "Sorry, that was an invalid move. Please enter 1-9:"
      display_board(@board)
      i = gets.strip
      index = input_to_index(i)
      m = valid_move?(index)
      move(index, current_player)
    end
  end
end
def turn_count
  count = 0
  board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
  count
end

def position_taken?(index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(index)
if !position_taken?(index) && index.between?(0, 8)
  true
else false
end
end
end
