class TicTacToe 
   def initialize(board= nil)
    @board= board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [6,4,2]  #Right start diagonal
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 
  end
  
 def  input_to_index(user_input)
     user_input.to_i-1
    end

def move(index, character="X")
  @board[index] = character
  
end

def  position_taken? (index)

  
 if  @board[index] ==" " || @board[index] =="" || @board[index] == nil
   false 
   
 elsif @board[index] == "X" || @board[index] == "O"
   true
 
  end
end

def valid_move?(index) 
 index.between?(0,8) && position_taken?(index) == (false)
end 


def turn_count

   counter = 0 
   
  @board.each do |token|
    if token == "X" || token =="O"
  
 
  
  counter += 1
  
  end
end 
counter
end 

def current_player
  if turn_count % 2 == 0
    
    return "X"
    
  else 
    return "O"
end 

 end 

def turn
  puts "Please enter 1-9:"
  input= gets.strip
  index = input_to_index(input)
  character= current_player
  
  if valid_move?(index)
  move(index, character)
  display_board
  
  else 
    turn
  end
end

def won?
  WIN_COMBINATIONS.each {|win_combo|
  
   index_0 = win_combo[0]
   index_1 = win_combo[1]
   index_2 = win_combo[2]
   
   position_1 = @board[index_0]
   position_2 = @board[index_1]
   position_3 = @board[index_2]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combo
    
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combo

end
}
    return false
 
 end
  def full?
   @board.all? {|index| index == "X" || index == "O"}
 end
 def draw?
    if !won? && full?
    return true
  else 
    return false
 end
end 
def over?
   if won? || full? || draw?
     return true
  else
    return false
    
  end
end
def winner
  index = []
  index = won?
  if index == false 
    return nil 
    
    else 
    if @board[index[0]] == "X"
      return "X"
    else 
      return "O"
  end
 end 
end 
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


