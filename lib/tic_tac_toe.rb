
#require 'pry'
class TicTacToe
   def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end
   WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [0,4,8],
  [2,5,8],
  [6,4,2]
]

def display_board
  board = @board
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

def move(index, current_player = "X" )
   @board[index] = current_player
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def position_taken?(index)
if @board[index] == " " || @board[index] == "" || @board[index] == nil
  return false
else true
  end
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
end

def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
   if valid_move?(index)
     move(index, current_player)
     display_board
   else
     turn
   end
 end

 def won?
    WIN_COMBINATIONS.detect do |combo|
      position1 = @board[combo[0]]
      position2 = @board[combo[1]]
      position3 = @board[combo[2]]
      if position1 == position2 && position2 == position3 && position3 != " "
        return combo
      end
    false
  end
end

def full?
  @board.any? do |position|
      if position == " "
       return false
    end
  end
   true
end

def draw?
  @board.any? do |position|
    if position == " " || won?
      return false
    end
  end
  true
end

def over?
  draw? || won?
end

def winner
  if won?
     index = won?[0]
     return @board[index]
  end
  nil
end

def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
   end
end

end
