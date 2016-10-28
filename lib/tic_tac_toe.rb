class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(location, current_marker = "X")
  @board[location.to_i-1] = current_marker
  end

  def position_taken?(location)
     !(@board[location].nil? || @board[location] == " ")

  end

  def valid_move?(position)
if !position_taken?(position.to_i-1) && position.to_i.between?(1, 9)
  true
  else
  false
end
end

def turn
  puts "Please enter 1-9:"
  location = gets.strip
  if  valid_move?(location)
  move(location, current_player)
else
  turn
end
display_board
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

def full?
  @board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?
  !won? && full? == true
end

def over?
won? || draw? == true
end


  def winner
  if winning_combo = won?
   @board[winning_combo[0]]
  end
end

def play
while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # mid row
  [6,7,8], # bot row
  [0,3,6], # left col
  [1,4,7], # mid col
  [2,5,8], # right col
  [0,4,8], # diag to right
  [6,4,2]  # diag to left
  ]

end
