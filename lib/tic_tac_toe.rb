class TicTacToe
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
  def initialize()
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
   input.to_i - 1
 end

 def move(index, token = "X")
   @board[index] = token
 end

 def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
 end

 def valid_move?(index)
   !(position_taken?(index) || index<0 || index>8)
 end

 def turn()

   loop do
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index)
       move(index, current_player)
       display_board
       break
     end
   end
 end


 def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

 def turn_count
   @board.count{|token| token == "X" || token == "O"}
 end


 def won?
   WIN_COMBINATIONS.each_with_index do |win_combination, index|

     position_1 = @board[win_combination[0]] # load the value of the board at win_index_1
     position_2 = @board[win_combination[1]] # load the value of the board at win_index_2
     position_3 = @board[win_combination[2]] # load the value of the board at win_index_3

     if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
       return WIN_COMBINATIONS[index] # return the win_combination indexes that won
     end
   end
   return false
 end

 def full?
   @board.detect{|character| character == " " || character == nil?} == nil
 end

 def draw?
   !won? && full?

 end

 def over?
   draw?|| won?|| full?
 end

 def winner
   if winning_combo = won?
     @board[winning_combo[0]]
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
