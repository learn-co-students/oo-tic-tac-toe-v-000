# ### `TicTacToe` class.
# Open up `lib/tic_tac_toe.rb`. You'll be defining the main game class, `TicTacToe` in `lib/tic_tac_toe.rb`. Without that
# file defining a `TicTacToe` class, everything will break.
# Every method you build will be encapsulated by this class.
#
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(input)
  index = input.to_i - 1
end

def move(index, character)
  @board[index] = character
  turn_count
  display_board
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    m = valid_move?(index)
  if m == true
    character = current_player
    move(index, character)
  else m == nil
    puts "Sorry, that was an invalid move. Please enter 1-9:"
    display_board
    # turn(board)
    input = gets.strip
    index = input_to_index(input)
    m = valid_move?(index)
  end
end

def turn_count
   @board.count{|token| token == "X" || token == "O"}
 end

 def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

def won?
  WIN_COMBINATIONS.find do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]] && position_taken?(win_combination[0])
  end
end

def full?
  @board.none? do |i|
    i == " " || i.nil?
  end
end

def draw?
  won? == nil && full? == true
end

def over?
  draw? == true || won? != nil
end

def winner
  if won? != nil
    winner = @board[won?[0]]
  end
end

def play
until over? == true
  turn
end
if draw? == true
  puts "Cat's Game!"
else won?
  puts "Congratulations #{winner}!"
end
end
end
# Run the tests for the `#play` method by typing `rspec spec/02_play_spec.rb` in your terminal.
