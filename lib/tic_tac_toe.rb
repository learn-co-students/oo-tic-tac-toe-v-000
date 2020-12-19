
require "pry"
#defines a constant WIN_COMBINATIONS with arrays for each win combination
class TicTacToe

def initialize
  @board = Array.new(9, " ")
end


WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5],  # Middle row
[6,7,8], #lower row
[0,4,8], #horizontal row_a
[2,4,6], #horizontal_row_b
[1,4,7], #vertical_row_a
[0,3,6], #vertical_row_b
[2,5,8], #vertical_row_c
]

#display_board OO
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#input_to_index OO

def input_to_index(input)
@input = input.to_i-1
end

#move OO
def move(index, value)
   @board[index] = value
  return value
end


#valid_move?
def valid_move?(index)
  if index.between?(0,9) && !position_taken?(index)
    true
end
end

#position_taken?
def position_taken?(index)
  if @board[index] == "" || @board[index] == " " || @board[index] == nil
    false
  elsif @board[index] == "X" || @board[index] == "O"
    true
end
end

#turn_count
def turn_count
  counter = 0
  @board.each do |place|
    if place == 'X' || place == 'O'
    counter += 1
  end
  end
  return counter
end

#current_player

def current_player
  if turn_count % 2 == 0
    return 'X'
  else
    return 'O'
  end
end



def won?
WIN_COMBINATIONS.each do |combo|
 # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
 # grab each index from the win_combination that composes a win.
win_index_1 = combo[0]
win_index_2 = combo[1]
win_index_3 = combo[2]


 position_1 = @board[win_index_1] # load the value of the board at win_index_1
 position_2 = @board[win_index_2]
 position_3 = @board[win_index_3]


 if
   (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
   return combo
 end #end if
end #end to looping
return false
end #end def


 #full? if there is an available position then false else true
#IS BOARD FULL?
def full?
 if @board.include?(' ') || @board.include?('')
   return false
else
   return true
 end
end

 #draw?

#IS THERE A DRAW?
def draw?
 if !won? && full?
   return true
 end
end

#over?

#HAS SOMETHING HAPPENED?
def over?
  won? || draw?
end

 #winner

#WHO WON?
def winner
if won?
  combo = won?
return @board[combo[0]]
end
end

def turn
puts "Please enter 1-9:"
  position_taken = gets.strip
  index = input_to_index(position_taken)
  if !valid_move?(index)
    turn
  else
    move(index, current_player)
   display_board
  end
end


def play
turn until over?
   if won?

     puts "Congratulations #{winner}!"
  elsif draw?
  puts "Cat's Game!"

     puts "Congratulations #{winner}"
  elsif draw?
  puts "There has been a draw"

   end
 end
end
