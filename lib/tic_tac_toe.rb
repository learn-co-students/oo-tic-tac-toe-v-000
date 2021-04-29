class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ") 

  end
  
  
    WIN_COMBINATIONS = [
      [0, 1, 2], # Top row
      [0, 3, 6], # First column
      [0, 4, 8], # Diagonal top left-to-right
      [1, 4, 7], # Middle column
      [2, 5, 8], # Diagonal top right-to-left
      [3, 4, 5], # Middle row
      [6, 7, 8], # Bottom row
      [2, 4, 6]  # Right column
      ]
  
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  @index = user_input.to_i-1
end

def move(index, token = "X")
  token == "X" || token == "O"
 @board[index] = token
end

def position_taken?(index)
 if @board[index] == "X" || @board[index] == "O"
   true
 elsif @board[index] == " "
   false
 else
   false
  end
end

def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8)
    true
  else
    false
  end
end

def turn_count
 @board.count{|token| token == "X" || token == "O"}
 end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
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
  won = false
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return won = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return won = win_combination
    end
  end
  return won
end

def full?
  @board.all?{|index| index == "X" || index == "O" || index != " "}
  end

def draw?
    !won? && full?
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    @board[won?[0]]
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