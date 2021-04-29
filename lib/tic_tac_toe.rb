
class TicTacToe 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  counter = 0
  @board.each do |space|
 if space == "X" || space == "O"
 counter += 1
end
end
counter
end

def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
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
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[2])
  end
end

def full?
  @board.all? do |space| 
    space == "X" || space == "O"
  end
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
  else 
   nil
  end
end

def play
  until over?
    turn
  end
  if won?
  puts "Congratulations #{winner}!"
  elsif draw?
  puts "Cat\'s Game!"
  end
end

end