class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left row
  [1,4,7], # vertical middle row
  [2,5,8], # right row
  [0,4,8], # top left diag
  [2,4,6]  # top right diag
  ]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(position, token = "X")
  @board[position] = token
end

def position_taken?(index)
  if @board[index] != " " && @board[index] != ""
    true
  else
    false
  end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    true
end
end

def turn
  puts "Please enter move with 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
  else
    turn
end
  display_board
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  if turn_count % 2 == 0 
    return "X"
  else
    return "O"
  end
end
  
def won?
  WIN_COMBINATIONS.each do |winner|
  if @board[winner[0]] == @board[winner[1]] &&
       @board[winner[1]] == @board[winner[2]] && 
       position_taken?(winner[0])
       return winner
    end
end
false
end

def full?
 @board.any? do |empty|
   if empty == " "
     return false
  end
end
true
end

def draw?
  if won? == false && full? == true
    return true
end
end

def over?
  if won? || draw? || full? == true
    return true
  end
end

def winner
  if won?
    return @board[won?[0]]
end
end

def play
  until over? == true 
  turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
end
end

end