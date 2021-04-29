class TicTacToe
  def initialize(board = nil)
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
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player = "X")
  @board[index] = current_player
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
  player = current_player
  if valid_move?(index)
    move(index, player)
    display_board
  else
    turn
  end
end

def turn_count
counter = 0
@board.each do |element|
  if element == "X" || element == "O"
    counter += 1
  end
end
return counter
end

def current_player
turn_count.even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.select do |combination|
  win_index_1 = combination[0]
  win_index_2 = combination[1]
  win_index_3 = combination[2]
  
  
  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" 
    return combination
  else
    false
  end
  end
  false
end

def full?
  @board.select do |state| 
   if state == " "
    return false
   end
  end
end

def draw?
  if !won? && full?
    return true
  else
    false
  end
end

def over?
  if won? || draw? || full?
    return true
  else
    false
  end
end

def winner
  if !won?
    return nil
  else
  won?.detect do |array|
    return @board[array]
  end
end
end

def play
  until over? do
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end