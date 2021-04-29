class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Left diagonals
  [2,4,6] # Right diagonals
]

#display_board
def display_board
  puts " #{@board[0]} " "|" " #{@board[1]} " "|" " #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} " "|" " #{@board[4]} " "|" " #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} " "|" " #{@board[7]} " "|" " #{@board[8]} "
end

#input_to_index
def input_to_index(user_input)
  @user_input = user_input.to_i - 1
end

#move
def move(index, player = "X")
  @board[index] = player
end

#position_taken?
def position_taken?(index)
  @board[index]== "X" || @board[index] == "O"
end

#valid_move?
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

#turn_count
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

#current_player
def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

#turn
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

#won
def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

#full?
def full?
  @board.all?{|token| token == "X" || token == "O"}
end

#draw?
def draw?
  !won? && full?
end

#over?
def over?
  won? || draw?
end

#winner
def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

#player
def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
