class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
[0,1,2], #top_row_win
[3,4,5], #middle_row_win
[6,7,8], #bottom_row_win
[0,3,6], #vertical_left_win
[1,4,7], #vertical_middle_win
[2,5,8], #vertical_right_win
[0,4,8], #diagonal_left_win
[2,4,6], #diagonal_right_win
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

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    token = current_player
    move(index, token)
    display_board
  else
    turn
  end
end

def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = @board[win_index_1] # load the value of the board at win_index_1
  position_2 = @board[win_index_2] # load the value of the board at win_index_2
  position_3 = @board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_combination # return the win_combination indexes that won.
  end
  end
  false
  end

  def full?
  @board.all? do |position|
  position == "X" || position == "O"
  end
  end

  def draw?
  full? && !won?
  end

  def over?
  won? || draw? || full?
  end

  def winner
  if winning_array = won?
  winning_index = winning_array[0]
  winner = @board[winning_index]
end
end

def play
until over?
  turn
end
 if winner == "X"
  puts "Congratulations X!"
elsif winner == "O"
  puts "Congratulations O!"
  elsif draw?
  puts "Cat's Game!"
end
end
end
