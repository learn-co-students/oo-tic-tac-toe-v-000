class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS =[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],
[2,5,8], [2,4,6], [0,4,8]]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
  @user_input = user_input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
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

def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
 def won?
    WIN_COMBINATIONS.each do |win_combos|
    win_index_1 = win_combos[0]
    win_index_2 = win_combos[1]
    win_index_3 = win_combos[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" or  position_1 == "O" && position_2 == "O" && position_3 == "O"
      
     return win_combos
  
  end
end
  
  else false
  
end


def full?
  
  if @board.any?{|i| i == " "}
    return false
  
     else return true
   
 end
 end
 
 def draw?
  if full? && !won?
    return true
  else return false
    
end 
end



def over?
  if won? || draw?
    return true
  
 end 
end


def winner
  if won? != false
    @board[won?[0]]
 end 
end

def play
  
   until over? ==true
   turn
 end
   if won?
     puts "Congratulations #{winner}!"
     elsif draw?
     puts "Cat's Game!"
  
end
end

end