
class TicTacToe
  def initialize(board = nil)
  @board = board || Array.new(9, " ")
 end
 WIN_COMBINATIONS = [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [2,4,6],
 ]
 def display_board
   puts " #{@board[0]} " "|" " #{@board[1]} " "|" " #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} " "|" " #{@board[4]} " "|" " #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} " "|" " #{@board[7]} " "|" " #{@board[8]} "
 end
 def input_to_index(user_input)
   user_input.to_i - 1
 end

 def move(position, token)
   @board[position] = token
 end

 def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
 end

 def valid_move?(index)
   index.between?(0, 8) && position_taken?(index) == false
 end

 def turn_count
   turn = 0
   @board.each do |space|
     if space == "X" || space == "O"
       turn += 1
     end
   end
   turn
 end

 def current_player
    turn_count.even? ? "X" : "O"
 end

 def turn
   puts "Please enter 1-9:"
   input = gets.strip
   input = input_to_index(input)
   token = current_player
   if valid_move?(input)
     move(input, token)
   else
     turn
   end
   display_board
 end

 def won?
   WIN_COMBINATIONS.detect do |win|
     position_taken?(win[0] ) && @board[win[0]] == @board[win[1]] && @board[win[2]] == @board[win[0]]
   end
 end

 def full?
   @board.all? do |space|
   space == "X" || space == "O"
   end
 end

 def draw?
   if won?
     false
   elsif full?
     true
  end
 end
 def over?
   if won? || full? || draw?
    true
  end
 end
 def winner
   if won?
   win_index = won?[0]
   @board[win_index]
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
