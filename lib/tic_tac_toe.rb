class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  if index.between?(0, 8) && @board[index] == " " || @board[index] == ""
    true
  else
    false
end
end

def turn_count
  @board.count { |turns| turns == "X" || turns == "O"}
end

def current_player
  if turn_count.even?
    "X"
  else
    "O"
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    token = current_player
    move(index,token)
  else turn
  end
  display_board
end


def won?
  WIN_COMBINATIONS.any? do |combo|
    if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
      return combo
  end
end
end

def full?
  @board.all? {|token| token == "X" || token == "O"}
end

def draw?
  !won? && full?
end

def over?
  won? || draw? || full?
end

def winner
  if combo = won?
    @board[combo.first]
  end
end

def play
  while !over?
  turn
end
if won?
  puts "Congratulations #{winner}!"
else draw?
  puts "Cat's Game!"
end
end

end
