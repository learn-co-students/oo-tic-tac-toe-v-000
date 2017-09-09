class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def play
  until over? || won?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
end
end
# input = gets  THIS IS NOT NEEDED BECAUSE TURN(BOARD) ALREADY GETS INPUT, BOOM!


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?
  WIN_COMBINATIONS.find {|win_combination| @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])}
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)#Is input a baseword or a hardwired argument/method? #The input is an integer but we needed to show a conversion to integer just because that's how input could be accepted in order to make the needed -1 change to the index?
  input.to_i-1
end

def move(index, current_player)
    @board[index] = current_player
end
#why do i need a 0 in place of the default argument? Is it inherently needed or is it needed for the running of the Flatiron project itself?
def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8)#why do we need validmove in the first place? #why did we have to add thiis between aprt?
    true
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(index)
    player = current_player
    move(index, player)#this is all i need to execute,pass move
    display_board#this is how you call more than one method for the same if statement $why did i have to involve all of thee helper methods in this if statement
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def full?
  # is to check if there are any empty spaces
  @board.all? do |position|
  position == "X" || position =="O" # Will evaluate to true for 1, true for 3
end
end

def draw?
  !won? && full?
end


def over?
  won? || draw?
end

def winner
  if win_combo = won?
    win_combo == [0,1,2]
    return @board[win_combo[0]]
  end
end
end
