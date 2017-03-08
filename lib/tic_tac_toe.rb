
class TicTacToe
  def initialize(board = nil)
     @board = board || Array.new(9, " ")
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

   def move(index, token = "X")
     @board[index] = token
   end

   def position_taken?(index)
     @board[index] != " " && @board[index] != "" && @board[index] != nil
   end

   def valid_move?(index)
     position_taken?(index) == false && index.between?(0, 8) == true
   end

   def turn
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index) == false
       turn
     else move(index, current_player)
       display_board
     end
   end

   def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end

   def current_player
     if turn_count.even?
       return "X"
     elsif turn_count.odd?
       return "O"
     end
   end

   def won?
     WIN_COMBINATIONS.each do |win_array|
       board_row = @board[win_array[0]] + @board[win_array[1]] + @board[win_array[2]]
       if board_row == "XXX" || board_row == "OOO"
         return win_array
       end
     end
     false
   end

   def full?
     @board.all? do |spot|
       spot == "X" || spot == "O"
     end
   end

   def draw?
     if !won? == true && full? == true
       return true
     else
       return false
     end
   end

   def over?
     if full? == true || draw? == true || won? != false
       return true
     end
   end

   def winner
     letter = won?
     if letter
       return @board[letter[0]]
     end
   end

   def play
     until over? == true
       turn
     end
       if won? != false
         puts "Congratulations #{winner}!"
       else if draw? == true
         puts "Cat's Game!"
       end
     end
   end

end
