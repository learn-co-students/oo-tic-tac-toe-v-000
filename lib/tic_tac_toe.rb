class TicTacToe
   def initialize
     @board = [" "," "," "," "," "," "," "," "," "]
    end
    
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
[6,7,8],
[2,4,6],
[0,3,6],
[1,4,7],
[2,5,8],
[0,8,4]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player="X")
  @board[index] = current_player
end

def position_taken?(index)
  if @board[index]== " " || @board[index]== ""
    return false 
  else return true
end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
  def turn_count
@board.count {|x| x=="X" || x=="O"}
end
  
def current_player
  if turn_count % 2 ==0
    return  "X"
  else return "O"
end
 end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? { |win_index| @board[win_index] == "X" } ||
    win_combination.all? { |win_index| @board[win_index] == "O" }
  end
end

def full?
  @board.each do |i|
 if @board.any?{|i|i ==" "}
   return false 
else return true 
 end 
end
end
def draw?
 if full? && !won?
   return "Cat's Game!"
 else return false
 end
end

def over?
  if full? || won? || draw?
    return true
  else return false
end
  end
  
def winner
  
 won = won?
  if won !=nil
    return @board[won[0]] 
  end
  end
########################################
def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end