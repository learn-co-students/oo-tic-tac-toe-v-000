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


def input_to_index(input)
  input.to_i-1
end
  
def valid_move?(index)
  index.between?(0, 8) && !(position_taken?(index))
end 

def position_taken?(index)
 !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
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

def move(index, token)
  @board[index]=token
end

def current_player(turn)
    num = turn_count(index)
    if num % 2 == 0
      return "X"
    if num == 3
      return "X"
    if num == 4
      return "O"
    else
      return "O"
    end 
end 
end
