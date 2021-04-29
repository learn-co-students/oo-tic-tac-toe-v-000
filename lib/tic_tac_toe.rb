class TicTacToe
  def initialize(board = nil)
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @board = board      #|| Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  @index = user_input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
  @token = token
end

def position_taken?(index)
@board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
    @board.count do |space|
    # space != " "
    space == "X" || space == "O"
  end
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    @token = current_player
    move(index, @token)
    display_board
  else
    puts "Whoops! That's not a valid move"
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |win|
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"
  end

  end

  def full?
  @board.all? do |position|
    position == "X" || position == "O"
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
  end
  end

  def play
  until  over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"

  else
    puts "Cat's Game!"
  end

  end

end
