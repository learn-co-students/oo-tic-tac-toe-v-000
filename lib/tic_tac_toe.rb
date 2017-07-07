require 'pry'

class TicTacToe
  def initialize(board = nil)
    @board = board || board = Array.new(9," ")
  end

WIN_COMBINATIONS =
[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[2,5,8],[1,4,7],[0,3,6]]
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def input_to_index(user_input)
  user_input = user_input.to_i
  i = user_input - 1
end
def move(index, current_player)
  @board[index] = current_player
end
def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
def update_array_at_with(array, index, value)
  array[index] = value
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

  def turn_count
  count = 0
  @board.each do |character|
    if character == "X" || character == "O"
  count += 1

  end
  end
  count
  end
  def current_player
    if turn_count % 2 == 0
     "X"
    else
     "O"
    end
end
def won?
  WIN_COMBINATIONS.detect do |win_combo| # [0,1,2]

    @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && @board[win_combo[1]] != " "
  end
end

def full?
  @board.all?{|token| token != " "}
end

def draw?
  full? && !won?
end


def over?
  if draw? || won?
    true
  else
    false
  end
end

def winner
  if win_combo = won? # [0,1,2]
    @board[win_combo[0]]
  end
end


def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end
end
