class TicTacToe

   def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

   WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

   def display_board
      puts " #{@board[0]} " "|" " #{@board[1]} " "|" " #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} " "|" " #{@board[4]} " "|" " #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} " "|" " #{@board[7]} " "|" " #{@board[8]} "
   end

   def input_to_index(value)
       value.to_i - 1
       #position = value.to_i
       #position - 1
   end

   def move(index, character)
       @board[index] = character
   end

   def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
   end

   def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
   end

   def turn_count
       @board.count{|character| character == "X" || character == "O"}
   end

   def current_player
       turn_count.even? ? "X" : "O"
   end

   def turn
     puts "Please enter 1-9:"
     number = gets.strip
     index = input_to_index(number)

     if valid_move?(index)
       character = current_player
       move(index, character)
       display_board
     else
       turn
     end
 end

   def won?
     WIN_COMBINATIONS.find do |win_array|
       @board[win_array[0]] == @board[win_array[1]] && @board[win_array[1]] == @board[win_array[2]] && position_taken?(win_array[0])
     end
 end

 def full?
   @board.all? do |character|
     character == "X" || character == "O"
   end
 end

 def draw?
    !won? && full?
 end

 def over?
   draw? || won?
 end

 def winner
   if won? && @board[won?[0]] == "X"
     return "X"
   elsif won? && @board[won?[0]] == "O"
     return "O"
   else
     return nil
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
