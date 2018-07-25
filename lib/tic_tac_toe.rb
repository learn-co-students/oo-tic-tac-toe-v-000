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

def turn(board)
  puts "Please enter 1-9:"
  input= gets.strip
  index = input_to_index(input)

   
  move(index, character="X")
  display_board
  valid_move?(index)
  index.between?(0, 8) && @board[index] ==" " || @board[index] ==""
  until index.between?(0, 8)
end
end
      puts "Please enter 1-9:"
end






end




  