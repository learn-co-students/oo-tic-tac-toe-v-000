require 'pry'
class TicTacToe
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

 WIN_COMBINATIONS = [
   [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
 ]

 def display_board
   @board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index(input)
   input.chomp
   input.to_i - 1
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def move (index, player)
  #binding.pry
  @board[index] = player
end

def valid_move?(index)
  !position_taken?(index) &&  index.between?(0,8)
end

def turn_count
  counter = 0
  @board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count.even?
return  "X"
else
  return "O"
end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player
  if valid_move?(index)
    move(index,player)
  else
    turn
  end
  display_board
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|

if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" ||
  @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
    return win_combination
  else
    false
  end
end
end

def full?
 final_tally = 0
 @board.each do |token|
   if token == "X" || token == "O"
     final_tally += 1
   end
 end
  if final_tally == 9
    true
  else
    false
  end
end

def draw?
  if !won? && full?
    true
  else
    false
  end
end

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

def winner
  combo = won?
  if !combo
    return nil
  else
    return @board[combo[2]]
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
