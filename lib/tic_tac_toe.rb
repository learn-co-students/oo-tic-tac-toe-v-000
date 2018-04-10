class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]

]
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
def input_to_index(input)
  input.to_i - 1
end
def move(index, value="X")
  @board[index] = value
end
def position_taken?(index)
if @board[index] == " "
return false
elsif @board[index] == ""
return false
elsif @board[index] == nil
return false
elsif @board[index] == "X" || "O"
return true
end
end
def valid_move?(index)
if position_taken?(index)
  return false
elsif index.between?(0, 8)
  return true
else
  return false
end
end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      position_taken?(combo[1]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
    end
  end
def full?
@board.all? do |full_board|
full_board == "X" || full_board == "O"
end
end
def draw?
if !!full? && !won?
 true
else
  false
end
end
def over?
if won? || draw? || full?
  true
else
  false
end
end
def winner
if !!won?
@board[won?[0]]
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
def play
  until !!over?
    turn
  end
  if winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
end
end

end
