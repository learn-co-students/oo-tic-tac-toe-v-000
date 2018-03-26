class TicTacToe

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

def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

def input_to_index(user_input)
input = user_input.to_i - 1
return input
end

def move(index, value)
@board[index] = value
end

def position_taken?(index)
if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
  return false
else
  return true
end
end

def valid_move?(index)
if index.between?(0,8) && !position_taken?(index)
  return true
else
  return false
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
  puts "Please enter 1-9:"
  user_input = gets.strip
end
end

def turn_count
@board.count{|token| token == "X" || token == "O"}

turns = 0
@board.each do |token|
if token == "X" || token == "O"
 turns += 1
end
end
turns
end

def current_player
 turn_count % 2 == 0 ? "X" : "O"
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
if @board.detect {|i| i == " " || i == nil}
  return false
else
  return true
end
end

def draw?
if !won? && full?
  return true
else
  return false
end
end

def over?
if draw? || won?
  return true
else
  return false
end
end

def winner
  if won? && @board[won?[0]] == "X"
    return "X"
  elsif won? && @board[won?[0]] == "O"
    return "O"
  else
    return nil
  end
end

def play
  until over?
    turn
end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end
