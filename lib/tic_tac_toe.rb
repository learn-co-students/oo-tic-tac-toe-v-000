class TicTacToe
  def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end
 WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,4,8],
   [2,4,6],
   [0,3,6],
   [1,4,7],
   [2,5,8]
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

   def move(location, player)
     @board[location] = player
   end

   def position_taken?(location)
     @board[location] != " " && @board[location] != ""
   end

   def valid_move?(loacation)
     loacation.between?(0,8) && !position_taken?(loacation)
   end

   def turn_count
   counter = 0
   @board.each do |token| # " ", "X", "O"
   if token != " "
     counter += 1
   end

   end
   counter
   end

   def current_player
     turn_count % 2
     if turn_count.even?
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

   WIN_COMBINATIONS.detect do |win_combo|
     win_index_1 = win_combo[0]
     win_index_2 = win_combo[1]
     win_index_3 = win_combo[2]



     if @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X"
       return win_combo # return the win_combination indexes that won.
     elsif @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
         return win_combo # return the win_combination indexes that won.
     else
       false
     end

     end
   end

   def full?
   @board.all? {|token| token == "X" || token == "O" }
   end

   def draw?
   !won? && full?
   end

   def over?
     won? || full? || draw?
   end

   def winner
     WIN_COMBINATIONS.detect do |win|
       win_index_1 = win[0]
       win_index_2 = win[1]
       win_index_3 = win[2]



       if @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X"
         return "X" # return the win_combination indexes that won.
       elsif @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
           return "O"# return the win_combination indexes that won.
       else
         false
       end
   end
   end


   def play
     until over?
       turn
     end

     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end
   end

   
end