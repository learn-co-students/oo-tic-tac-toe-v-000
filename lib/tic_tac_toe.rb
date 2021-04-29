class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First row up/down
  [1,4,7], # Second row up/down
  [2,5,8], # Third row up/down
  [0,4,8], # Digonal top left to bottom right
  [2,4,6]  # Digonal top right to bottom left
]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
def input_to_index(input)
  input.to_i - 1
end
  def move(index, token)
  @board[index.to_i] = token
end
def position_taken?(index)
 @board[index] !=  " " 
end
def valid_move?(index)
       index.between?(0, 8) && !position_taken?(index)
  end
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
   else
    puts "try again"
    turn
  end
  display_board
end
 def current_player
    turn_count % 2 == 0 ? "X" : "O"
 end
 def turn_count
    @board.count{|token| token == "X" || token == "O"}
 end
 def won?
  WIN_COMBINATIONS.each {|win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win_combination
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
   return win_combination
 end
  }
  false 
end
def full?
  @board.all? {|index| index == "X" || index =="O"}
end
def draw?
  if !won? && full?
    true 
  else
    false 
  end
end
def over?
  if won? || full? || draw?
    true
  else
    false
  end
end
def winner
  index = won?
  if index 
    return @board[index[0]]
  end
end
def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end

