require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end


 WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  indexInput = user_input.to_i
  indexInput - 1
end

def move(index, player_token = "X")
  @board[index] = player_token
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  indexMove = index.to_i
  indexMove - 1
  indexMove.between?(0, 8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(index)
    turn
  end
  move(index, current_player)
  display_board

end

def turn_count
  # in ruby we have a count method that counts the elements based on a condition
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
 if turn_count % 2 == 0
    "X"
  else
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

    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"

  end
end

def full?
  @board.all? {|token| token == "X" || token == "O"}
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
 if winning_positions = won? # winning_positions = return value of won?(board), which is an array or nil/false
   @board[winning_positions[0]]
 end
end

def play
  while !over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end

end
