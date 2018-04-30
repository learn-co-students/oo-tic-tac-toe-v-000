require "pry"
class TicTacToe
  puts "Welcome to Tic Tac Toe!"
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]


def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def move(index, value="X")
  @board[index] = value
end

def turn
  value = gets.strip
  index = input_to_index(value)
  if valid_move?(index) 
    move(index, current_player)
    display_board
  else 
    puts "NOPE!"
    turn
  end
end

def input_to_index(input)
  input.to_i-1
end
    
def valid_move?(index)
  index.between?(0, 8) && !(position_taken?(index))
end 
  
def position_taken?(index)
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    false
  else 
    true
  end
end


def turn_count
  counter=0
  @board.each do |position|
    if (position == "X" || position == "O")
      counter += 1
    end
  end
  counter
end

def current_player
    num = turn_count
    if num % 2 == 0
      return "X"
    else
      return "O"
    end 
end 
end
