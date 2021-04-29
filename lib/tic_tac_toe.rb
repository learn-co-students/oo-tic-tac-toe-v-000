require "pry"

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # left column
  [1,4,7],  # middle column
  [2,5,8],  # Right column
  [0,4,8],  # Diagonal 1
  [2,4,6]  # Diagonal 2
]

def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(index, player)
  @board[index] = player
end

def position_taken?(index)
 if @board[index] == "X" || @board[index] == "O"
   true
 else (@board[index] != " ") || (@board[index] != "") || (@board[index] != nil)
   false
 end
end


def valid_move?(index)
  # binding.pry
 index.between?(0, 8) && !position_taken?(index)
end

def turn_count
# binding.pry
9 - @board.count(" ")
end

def current_player
count = turn_count
  if count % 2 == 0
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
    move(index, token)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |winning_arrays|
  # binding.pry
  @board[winning_arrays[0]] == @board[winning_arrays[1]] && @board[winning_arrays[1]] == @board[winning_arrays[2]] && position_taken?(winning_arrays[0]) #because the values at each position - they're all the same
  end
end

def full?
@board.all? do |token|
  if token == "X" || token == "O"
    true
  else
    false
    end
  end
end


def draw?
full? && !won?
end

def over?
full? || won? || draw?
end

def winner
winning_player = ""
indexes = won?
  if won? != nil
   winning_player = @board[indexes[0]]
   winning_player
end
end

def play
  until over?
   turn
  end
  if won?
    # binding.pry
  puts "Congratulations #{winner}!"
  elsif draw?
  puts "Cat's Game!"
  end
end

end
# def turn
# move(index, player)
# position_taken?(index)
# valid_move?(index)
# end
