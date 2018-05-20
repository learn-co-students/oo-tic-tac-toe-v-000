
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left row top to bottom
  [1,4,7], #Center row top to bottom
  [2,5,8], #Right row top to bottom
  [0,4,8], #Top left to bottom right
  [2,4,6], #Top right to bottom left
]

  def current(board)
    print @board
  end

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

  def move(position, char)
    @board[position] = char
  end

  def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
  counter = 0

  @board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    else
      false
    end
  end
  counter
end
 
 def current_player
  if turn_count % 2 == 0
    current_player = "X"
  else 
    current_player = "O"
  end
  return current_player
end

  def turn
  puts "Please enter 1-9:"
  #gets the user input
  user_input = gets.strip
  #input to index
  index = input_to_index(user_input)
  char = current_player
  if valid_move?(index)
    move(index, char)
    display_board
  else
    turn
  end
end
  
  def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end
  
  def full?
  @board.all?{|occupied| occupied != " "}
end
  
  def draw?
  !(won?) && (full?)
end
  
  def over?
  won? || full? || draw?
end
  
  def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end

def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end




#bin/tictactoe
#require 'pry'
#require_relative '../lib/tic_tac_toe.rb'

#game = TicTacToe.new
#game.play

  
  
# #Validation Check
#   if valid_move?(board,index)
#     puts 'valid move'
#     move(board, index)
#     display_board(board)
#   else
#     puts 'try again'
#     turn(board)
#   end
#   display_board(board)
# end


  
  
#   def won?(board)
 
#   WIN_COMBINATIONS.find do |win_combo|
#     win_index_1 = win_combo[0]
#     win_index_2 = win_combo[1]
#     win_index_3 = win_combo[2]
  
#     position_1 = board[win_index_1]
#     position_2 = board[win_index_2]
#     position_3 = board[win_index_3]
  
#     position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_3)
  
#   end
# end




end



#@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

