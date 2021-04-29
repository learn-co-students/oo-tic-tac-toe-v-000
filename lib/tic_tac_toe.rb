class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #middle_row_win
    [6,7,8], #bottom_row_win
    [0,3,6], #left_column_win
    [1,4,7], #middle_column_win
    [2,5,8], #right_column_win
    [0,4,8], #diagonal_LtoR_win
    [2,4,6], #diagonal_RtoL_win
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

 def input_to_index(user_input)
  user_input.to_i - 1
 end

 def move(index, token = "X")
   @board[index] = token
 end

 def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
 end

 def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
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

 def turn_count
   counter = 0
   @board.each do |player|
     if player == "X" || player == "O"
       counter +=1
     end
   end
   return counter
 end

 def current_player
   turn_count.even? == true ? "X" : "O"
 end

 def won?
   WIN_COMBINATIONS.detect do |win_combination|
     @board[win_combination[0]] == @board[win_combination[1]] &&
     @board[win_combination[1]] == @board[win_combination[2]] &&
     position_taken?(win_combination[0])
   end
 end

 def full?
   @board.all? do |index|
     index == "X" || index == "O"
   end
 end

 def draw?
   !won? && full?
 end

 def over?
   won? || draw?
 end

 def winner
   if won?
     win_index = won?
     @board[win_index[0]]
   end
 end

 def play
   until over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   end
   if draw?
     puts "Cat's Game!"
   end
 end
end
