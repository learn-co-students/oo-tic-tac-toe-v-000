class TicTacToe

def initialize
  @board=[" ", " ", " ", " ", " ", " ", " ", " ", " ",]
end
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(string)
  string.to_i - 1
end

def move(space, char)
  @board[space] = char
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end

def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)
    true
  else
    false
end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  count = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      count += 1
    end
end
count
end

def current_player
  if turn_count.even?
    "X"
  else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combinations|
    index_1 = combinations[0]
    index_2 = combinations[1]
    index_3 = combinations[2]

    position_1 = @board[index_1]
    position_2 = @board[index_2]
    position_3 = @board[index_3]

    position_1 == position_2 && position_2 == position_3 && position_3 != " "
  end
end

def full?
  @board.all? do |complete|
    complete != " "
  end
end

def draw?
!won? && full?
end

def over?
  won? || full? || draw?
end

def winner
  won = won?
if won
@board[won[0]]
end
end

def play
  until over?
    turn
  end
if won?
  puts "Congratulations " + winner + "!"
else
  puts "Cat's Game!"
end
end
end
