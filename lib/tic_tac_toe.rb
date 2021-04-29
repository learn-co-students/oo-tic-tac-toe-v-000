class TicTacToe
  def initialize(board = nil)
  @board = board 
  @board = Array.new(9, " ")
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
  puts " #{@board[0]} ""|"" #{@board[1]} ""|"" #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} ""|"" #{@board[4]} ""|"" #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} ""|"" #{@board[7]} ""|"" #{@board[8]} "
end 

def input_to_index(user_input)
  number = user_input.to_i
  index = number - 1 
  return index 
end

def move(index, player_character)
  @board[index]=player_character
  return @board 
end 

def position_taken? (index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return false 
  else 
    return true 
  end
end 

def valid_move?(index)
if position_taken?(index) == false && index.between?(0,8)
    return true
  else 
    return false 
end 
end 

def turn
  puts "Please enter 1-9:"
  users_input=gets.strip
  index = input_to_index(users_input)
  
  if valid_move?(index)
    move(index, current_player)
    display_board
  else turn
  end 
end 

def turn_count
count = 0 
@board.each do |turn| 
  if turn == "X" || turn == "O"
  count += 1 
  end 
end 
return count 
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end 

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[2]] == @board[win_combo[1]] && position_taken?(win_combo[1]) 
end 
end

def full?
@board.all? do |position|
  position == "X" || position == "O"
end
end 


def draw?
  if full? && !won?
    return true 
  end  
end  


def over?
  if full? || won? || draw?
    return true
  end 
end 


def winner
  if won?
    return @board[won?[0]]
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
 