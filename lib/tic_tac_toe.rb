class TicTacToe
  def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

#possible win index combinations
   WIN_COMBINATIONS = [
     [0, 1, 2], #top row
     [3, 4, 5], #middle row
     [6, 7, 8], #bottom row
     [0, 4, 8], #left diagonal
     [2, 4, 6], #right diagonal
     [0, 3, 6], #left vertical
     [1, 4, 7], #middle vertical
     [2, 5, 8]  #right vertical
   ]

#displays Tic Tac Toe board
   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

#Takes user input and correlates to an index on the board
   def input_to_index(user_input)
     user_input.to_i - 1
   end

#Puts the current player's token in the board index received in input_to_index
   def move(index, current_player)
     @board[index] = current_player
   end

#Checks to see if the position on the board is taken. Returns true if taken, false if open.
   def position_taken?(index)
     if @board[index] != "X" && @board[index] != "O"
       false
     else
       true
     end
  end

#Checks to see that the move index is between 0 and 8, and that the position on the board is not taken.
   def valid_move?(index)
     if index.between?(0,8) && !position_taken?(index)
       true
     else
       false
     end
   end

#Keeps track of how many turns
   def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end

#Based on the turn count, keeps track of the current player
   def current_player
     if turn_count % 2 == 0
       return "X"
     else
       return "O"
     end
   end

#Goes through the beginning to end of a turn
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

#checks to see if the game is won. Returns the winning combo for a win, and false for a draw.
   def won?
     WIN_COMBINATIONS.detect do |win_combinations|
       win_index_1 = win_combinations[0]
       win_index_2 = win_combinations[1]
       win_index_3 = win_combinations[2]
       position_1 = @board[win_index_1]
       position_2 = @board[win_index_2]
       position_3 = @board[win_index_3]
     if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combinations
     else
       false
     end
     end
   end

#Checks to see if the board is full
   def full?
     @board.all? do |index|
       index == "X" || index == "O"
     end
   end

#Returns true if the game is a draw
   def draw?
     if !won? && full?
       true
     else
       false
     end
   end

#Returns true if the game is over
   def over?
     if won? || draw?
       true
     else
       false
     end
   end

#Returns the winner of the game
   def winner
     win_index = won?
       if won?
         return @board[win_index[0]]
       end
   end

#Plays through an entire game
   def play
     until over?
       turn
     end
     winning_player = winner
     if draw?
       puts "Cat's Game!"
     elsif won?
       puts "Congratulations #{winning_player}!"
     end
   end

end
