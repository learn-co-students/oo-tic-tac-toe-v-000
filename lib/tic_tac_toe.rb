require_relative '../lib/tic_tac_toe.rb'
require "pry"
class TicTacToe
  def initialize
    @board=Array.new(9, " ")
  end
  WIN_COMBINATIONS=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def input_to_index(user_input)
  user_input.to_i
  index = user_input.to_i - 1
end
def move(index, token)
    @board[index.to_i] = token
end
def position_taken?(board = @board, index)
  index = @board[index.to_i]
  if index == " "
  return false
  elsif index == ""
  return false
  elsif index == nil
  return false
  elsif index == "X"
  return true
  else index == "O"
  return true
  end
end
def valid_move?(index)
  if @board[index.to_i] == "X"
    return false
  elsif @board[index.to_i] == "O"
    return false
  elsif index.to_i >= 0 && index.to_i <= 8
    return true
  end
end
def turn_count(board = @board)
  counter = 0
  @board.each do |index|
  counter <= 8
    if index == " "
      counter += 0
    elsif index == "O"
      counter += 1
    else
      counter += 1
    end
  end
  counter
end
def current_player
      if turn_count(board = @board)%2==0
      return "X"
    else turn_count(board = @board)%2==1
      return "O"
      end
end
def turn
    puts "Please enter 1-9:"
    user_input = gets
    index = input_to_index(user_input)
      if valid_move?(index)
        token = current_player
        move(index, token)
        display_board
      elsif
        turn
      end
  end
def won?
  board = @board
  WIN_COMBINATIONS.detect do |index|
  board[index[0]] == board[index[1]] && board[index[1]] == board[index[2]] && position_taken?(board,index[0])
  end
end
def full?
  board = @board
  if board[0] != " " && board[1] != " " && board[2] != " " && board[3] != " " && board[4] != " " && board[5] != " " && board[5] != " " && board[6] != " " && board[7] != " " && board[8] != " "
 true
else
  false
end
end
def draw?
  board = @board
  if won? != nil
    false
  elsif full?
    true
  elsif board[0] == " " || board[1] == " " || board[2] == " " || board[3] == " " || board[4] == " " || board[5] == " " || board[6] == " " || board[7] == " " || board[8] == " " ||
    false
  end
end
def over?(board = @board)
      if won?
        true
      elsif draw?
        true
      else
        false
      end
end
def winner(board = @board)
  board = @board
  WIN_COMBINATIONS.detect do |index|
    if board[index[0]] == board[index[1]] && board[index[1]] == board[index[2]] && board[index[0]] == "X" && position_taken?(board,index[0])
      return "X"
    elsif board[index[0]] == board[index[1]] && board[index[1]] == board[index[2]] && board[index[0]] == "O" && position_taken?(board,index[0])
      return "O"
    end
  end
end
def play
       while over?(board = @board) == false
           turn
       end
       draw?
       if won? == false
           turn(board)
         elsif won? == true
           over?(board = @board)
         elsif won?
           puts "Congratulations #{winner(board = @board)}!"
         elsif draw? == true
           puts "Cat's Game!"
         end
      end
 end
