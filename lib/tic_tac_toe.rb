class TicTacToe

 def initialize
   @board = Array.new(9, " ")
 end

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index(input)
   index = input.to_i - 1
 end

 def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
 end

 def valid_move?(index)
   if index <= 8 && index >= 0 && position_taken?(index) == false
     return true
   else
     return false
   end
 end

 def move(index, char)
   @board[index] = char
 end

 def turn
   puts "Please enter 1-9:"

   input = gets.strip
   index = input_to_index(input)

   if valid_move?(index) == true
     move(index, current_player)
     display_board
   else
     turn
   end
 end

 def turn_count
   count = 0
   @board.each do |place|
     if place != " "
       count += 1
     else
     end
   end
   return count
 end

 def current_player
   if turn_count % 2 == 0
     "X"
   else
     "O"
   end
 end


 WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8],
   [0, 4, 8],
   [2, 4, 6]
 ]


 def won?
   winning_array = []
   WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = @board[win_index_1]
     position_2 = @board[win_index_2]
     position_3 = @board[win_index_3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       winning_array = win_combination
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       winning_array = win_combination
     else
     end
   end
   if winning_array.empty?
     false
   else
     winning_array
   end
 end

 def full?
     @board.none? {|place| place == " "}
 end

 def draw?
   if full?
     if won? != false
       false
     else
       true
     end
   else
     false
   end
 end

 def over?
   if won? != false
     true
   elsif draw?
     true
   else
     false
   end
 end

 def winner
   if won? != false
     return @board[won?[0]]
   else
     return nil
   end
 end

 def play
   puts "Welcome to Tic Tac Toe!"
   display_board
   until over? == true
       turn
   end
   if won? != false
       puts "Congratulations #{winner}!"
   else
       puts "Cat's Game!"
   end

 end

end
