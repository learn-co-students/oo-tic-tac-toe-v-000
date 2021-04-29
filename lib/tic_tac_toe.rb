class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left row win
  [1,4,7], #middle row win
  [2,5,8], #right row win
  [0,4,8], #left diagonal
  [2,4,6] #right diagonal
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, char)
  @board[index] = char
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end


def turn_count
counter = 0
@board.each do |char|
  if char != " "
  counter += 1
end
end
counter
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
    move(index, current_player)
    display_board
  else
    turn
  end
end


def won?
  WIN_COMBINATIONS.detect do |win|
    @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
end
end


def full?
  @board.all? do |index|
    if index != " "
        true
    elsif
      index  == " "
        false
    end
  end
end



def draw?
  if full? && !won?
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
  if win = won?
  @board[win.first]
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
