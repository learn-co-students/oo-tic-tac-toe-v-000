#An Obeject Oriented Tic Tac Toe Game (includes all methods needed to play 2 player tic tac Toe)
class TicTacToe
#Array to store user data (X or O)(this is an instance variable)
def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
#Possible Winning Outcomes (This is a constant)
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8,], #Horizontal Wins
[0,3,6], [1,4,7], [2,5,8], #Vertical Wins
[0,4,8], [6,4,2]] #Diagonal Wins
#Prints out arbitrary board (this is connected to the board array)
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
#Takes user input and converts it to an integer and subtracts one for the array
def input_to_index(user_input)
  index = user_input.to_i-1
end
#takes a user value and moves it into the array
def move (index, user_input)
  @board[index] = user_input
end
#return t/f based on wether pos is taken or not
def position_taken? (index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end
#Valid Move Method -- Is the index value between 1 and 8 and is it in an open square
def valid_move?(index)
  if index.between?(0, 8) && position_taken?(index) == false
    return true
  else
    return false
  end
end
#Turn count method check the spots on the array and determine if any value has been placed in them if so increment the counter
def turn_count
  counter = 0
  @board.each do |position|
    if position == "X" || position == "O"
      counter = counter + 1
    end
  end
  return counter
end
#if the current move is an even number then the current player will be x (X or odd moves while O are even moves)
def current_player
  if turn_count%2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
  return current_player
end
#Turn method
def turn
#This is the initial prompt telling our user to input
  puts "Please enter 1-9:"
#this gets our user input
  user_input= gets.strip
  index = input_to_index(user_input)
#If the outcome of the valid move method is true then run the board method and display the board
  if valid_move?(index) == true
    move(index, current_player)#calling on our index and the current player (X or O)
    display_board
#if not run the turn method again
  else
    turn
  end
end

#need to review this
def won?
  WIN_COMBINATIONS.find do |win|
    @board[win[0]] == @board[win[1]] && @board[win[0]] == @board[win[2]] && position_taken?(win[1])
  end
end

#check the board to determine if it is empty if there is an empty space then it is not full
def full?
  if @board.detect {|square| square == " " || square == nil}
    return false
  else
    return true
  end
end
#if won is false and board is full then it is a draw
def draw?
  if !won? && full?
   return true
 else
   return false
 end
end
#if won is true or draw is true the game is over
def over?
  if won? || draw?
    return true
  else
    return false
  end
end

def winner
  if won? != nil
    winner = @board[won?[0]] #need clarification on this line
  end
end
#method that plays the game until over then congratulates the winner
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
