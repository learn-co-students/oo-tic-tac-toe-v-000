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
 def input_to_index(user_input)
   user_input.to_i - 1
 end
 def move(index, char = "X")
   @board[index] = char
 end
 def position_taken?(index)
   @board[index] != " " && @board[index] != ""
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
   @board.each do |char|
     if char == "X" || char == "O"
       counter += 1
     end
   end
   return counter
 end
 def current_player
   count = turn_count
   if count % 2 == 0
     return "X"
   else
     return "O"
   end
 end
 def won?
   WIN_COMBINATIONS.each do |combo|
     win_index_1 = combo[0]
     win_index_2 = combo[1]
     win_index_3 = combo[2]
     position_1 = @board[win_index_1]
     position_2 = @board[win_index_2]
     position_3 = @board[win_index_3]
     if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
       return combo
     end
   end
 else
   false
 end
 def full?
   @board.all? do |index|
     index == "X" || index == "O"
   end
 end
 def draw?
   if won? == false && full? == true
     return true
   else
     false
   end
 end
 def over?
   if won? || full? || draw?
     return true
   else
     false
   end
 end
 def winner
   if won? != false
     combo = won?
     index = combo[0]
     return @board[index]
   else
     nil
   end
 end
 def play
   until over?
     turn
   end
   if winner == "X"
     puts "Congratulations X!"
   elsif winner == "O"
     puts "Congratulations O!"
   else
     puts "Cat's Game!"
   end
 end
end
