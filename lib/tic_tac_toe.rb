require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

def board=(board)
  @board = board
end

def board
  @board
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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
 end

 def turn_count
   # this method is to count valid turns that have been made
   # pass the argument board
   turn = 0
   # set the turn to 0
   board.each do |index|
     # pass the array board and look for positions passed
   if index == "X" || index == "O"
     # only positions with X or O gets passed and counted
     # if user puts in either X or 0 then...
     turn += 1
     #then plus the increment at 1
     # that is the same as turn = turn + 1
   end
   end
   turn
 end

 def current_player
   # this method is to determine whose turn it is
   # now call the turn_count(board) method Here
   if turn_count.even?
     # at the same time, the first input will be determined if its
     # even or not
   # player who goes first is X, the second player gets to be O
   # so since turn starts at 0, X represents even turns
   # O represents odd turns
     "X"
     # the line beneath if will always return. so puts function is implied
   else
     "O"
   end
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

 def won?
  WIN_COMBINATIONS.detect do |combo|
     position_taken?(combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
   end
 end

 def full?
    board.all? do |spot|
   spot == "X" || spot == "O"
   end
 end

 def draw?
    full? && !won?
 end

 def over?
  if draw?
    true
 elsif won?
   true
   end
 end

 def winner
   #binding.pry
   if won?
     board[won?[0]]
   end
 end

 def play
   until over?
     turn
   end
 if won?
     puts "Congratulations #{winner}!"
 else
     puts "Cat's Game!"
   end
 end

 end
