class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def board 
    @board
  end
  
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

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(input)
 index = "#{input}".to_i - 1
end

#@index? 

def move(index, character = "X")
  @board[index] = character
  return @board 
end

def position_taken?(index)
  if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
    return false 
  else
    return true 
  end 
end 

def valid_move?(index)
  if (position_taken?(index) == false) && (index.between?(0, 8))
    return true
  else
    return false 
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  
  @index = input_to_index(input)
  @character = current_player

  if valid_move?(@index) == true 
  move(@index, @character)
  display_board
  else 
 turn
  end 
end

def turn_count
counter = 0
@board.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
  else turn == " "
    counter 
  end
end
return counter
end

def current_player
  if turn_count.even? == true 
   return "X"
 else 
 return "O"
end
end
  
def won?
WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
end
end

def full?
 @board.all?{|position| position == "X" || position == "O"}
end

def draw?
 !won? && full?
end 

def over?
  if won? || full? || draw?
    return true 
  end
end

def winner
if winning_combo = won?
@board[winning_combo.first]
end
end

def play
  while !over?
    turn
  end
  if draw?
  puts "Cat's Game!"
else won?
  puts "Congratulations #{winner}!"
end 
end  
    
end