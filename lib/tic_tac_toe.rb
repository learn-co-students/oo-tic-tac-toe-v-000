class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  # Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                   [0,1,2], # top row
                   [3,4,5], # middle row
                   [6,7,8], # bottom row
                   [0,3,6], # left column
                   [1,4,7], # middle column
                   [2,5,8], # right column
                   [0,4,8], # left start diagonaly
                   [2,4,6] # right start diagonaly
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
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end
def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end
def full?
  @board.all? { |occupied| occupied != " "  }
end
def draw?
  if !won? && full?
    return true
  else
    return false
  end
end
def over?
   draw? || full? || won?
end
def winner
  if won?
    winner = @board[won?[0]]
  elsif !won?
    return nil
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
  else
    return nil
  end
end
#def play
#    turn until over?
#    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#  end
end
