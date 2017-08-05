class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def board=(board)
    @board = board
  end
  def board
    @board
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
def move(index, value)
  @board[index]= value
end
def position_taken?(index)
  if @board[index] == "" || @board[index] == " " || @board[index] == nil
    return false
  else return true
  end
end
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
def turn_count
  count = 0
  @board.each do |index|
    if index != "" && index != " " && index != nil
      count +=1
    end
  end
  return count
end
def current_player
  if turn_count % 2 == 0
      return "X"
    else return "O"
  end
end
def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, value=current_player)
    display_board
  else turn
  end
end
def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end
def full?
  !@board.any?{|element| element == nil || element == "" || element == " "}
end
def over?
  won? || full?
end
def draw?
  if full? && !won?
    return true
  else return false
  end
end
def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
display_board
while !over? && !draw?
  turn
end
if draw?
  puts "Cat's Game!"
elsif won?
  puts "Congratulations #{winner}!"
else
  puts "Congratulations X!"
end
end
end
