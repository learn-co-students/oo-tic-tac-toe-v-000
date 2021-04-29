class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

 def board=(board)
   @board = board
 end
 def board
   @board
 end

 WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 4, 8],
   [2, 4, 6],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8]
 ]

 def input_to_index(input)
   input.to_i - 1
 end

  def move(index, token = "X")
    @board[index] = token
  end

  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
     false
   else true
   end
  end


 def valid_move?(index)
   if index.between?(0, 8) && position_taken?(index) == false
     return true
   else false
   end
 end


 def turn
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(index) == true
     move(index, current_player)
     display_board
   else puts "Sorry, that was an invalid move. Please enter a value from 1-9."
     turn
   end
 end

 def turn_count
   count = 0
   @board.each do |turn|
     if turn == "X" || turn == "O"
       count+=1
     end
   end
 count
 end

 def current_player
   if turn_count.even?
     "X"
   else "O"
   end
 end

 def won?
   WIN_COMBINATIONS.detect do |combo|
     position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
   end
 end

 def full?
   @board.all? do |n|
     n == "X" || n == "O"
   end
 end

 def draw?
   full? == true && won? == nil
 end


 def over?
   if full? || won? || draw? || (won? && full?)
     true
   else false
   end
 end

 def winner
   if won? != nil
     winner = @board[won?[0]]
   end
 end

 def play
   until over?
     turn
   end
   if draw? == true
     puts "Cat's Game!"
   elsif
     puts "Congratulations #{winner}!"
   end
 end
end
