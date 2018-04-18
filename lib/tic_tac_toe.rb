class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  
  
  # Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  
  [0,3,6],
  [1,4,7],
  [2,5,8],
  
  [0,4,8],
  [2,4,6]
  ]
  
  #display_board
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  #input_to_index

def input_to_index(input)
  index = input.to_i - 1 
end

#move

def move(index, token = "X")
@board[index] = token
end 
  
#position_taken

def position_taken?(index)
  
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
     elsif @board[index] == "X" || @board[index] == "O"
    true
  else
  end
end

#valid_move

def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
end

#turn_count

def turn_count
  counter = 0
  @board.each { |turns| if turns == "X" 
  then counter += 1 
  elsif turns == "O" 
  then counter += 1
else
  counter += 0
end
}
counter
end

#current_player

def current_player 
  turn_count % 2 == 0 ? "X" : "O"
  
  #if turn_count.even?
   # "X"
  #else
    #"O"
  #end
end

#turn

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  value = current_player
  if valid_move?(index)
   move(index, value)
    display_board
  else
    turn
  end
end

#won?

  def won?
  
    WIN_COMBINATIONS.each do |win| 
      win_index_1 = win[0]
      win_index_2 = win[1]
      win_index_3 = win[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
    
      
      
    if position_1  ==  position_2 && position_2 == position_3 && position_taken?(win_index_2) 
    
    return win
    else
    end
  end
  return false
end

#full?
def full?
  @board.each do |player|
    
if  player == "X" || player == "O"
  next
else  
player = " "|| player = nil
return false
    end
 end
end

#draw?

def draw?
  if !won? && full?
    then true
  else 
    false
  end
end

#over?
def over?
  if draw? || full? || won?
  true
  else
    return false
  end
end

#winner
def winner
  x = @board.count("X")
  o = @board.count("O")
  if over? && won? && x > o
 "X"
  elsif over? && won? && o > x
  "O"
  else
    nil
  end
end

#play

def play
  until over?
  turn
  end
 
 if won?
   puts "Congratulations #{winner}!"
   
 else
   draw?
   puts "Cat's Game!"
   
 end
end

end