class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,4,8], # Diagonal Down Left To Right
    [2,4,6], # Diagonal Down Right To Left
    [0,3,6], # First Column
    [1,4,7], # Second Column
    [2,5,8], # Third Column
  ]

 def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

 def play
   while !over?
     turn
   end
   WIN_COMBINATIONS.each do |option|
     if @board[option[0]] == "X" && @board[option[1]] == "X" && @board[option[2]] == "X"
     puts "Congratulations X!"
     elsif
     @board[option[0]] == "O" && @board[option[1]] == "O" && @board[option[2]] == "O"
     puts "Congratulations O!"
     elsif draw?
     puts "Cat's Game!"
     end
   end
 end

 def input_to_index(location)
 location.to_i - 1
 end

 def turn
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(index)
     move(index, current_player)
   else
   turn
   end
 end

 def winner
   WIN_COMBINATIONS.each do |option|
     if @board[option[0]] == "X" && @board[option[1]] == "X" && @board[option[2]] == "X"
       return "X"
     elsif
       @board[option[0]] == "O" && @board[option[1]] == "O" && @board[option[2]] == "O"
       return "O"
     end
   end
   return nil
 end

 def valid_move?(index)
 index.between?(0,8) && !position_taken?(index)
 end

 def position_taken?(index)
   @board[index] != " "
 end

 def current_player
  turn_count % 2 == 0 ? "X" : "O"
 end

 def move(index, value)
 @board[index] = value
 display_board
 end

 def draw?
   if full? == true && won? == false
     return true
   else
     return false
   end
 end

 def won?
   WIN_COMBINATIONS.each do |option|
     if @board[option[0]] == "X" && @board[option[1]] == "X" && @board[option[2]] == "X"
       true
       winner
       return option
     elsif
       @board[option[0]] == "O" && @board[option[1]] == "O" && @board[option[2]] == "O"
       true
       winner
       return option
     end
   end
   false
 end

 def full?
   counter = 0
   @board.each do |space|
     if space != " "
       counter += 1
     end
   end
   if counter == 9
     return true
   end
 end

 def over?
   if draw?
     return true
   elsif full? && won?
     return true
   elsif won?
     return true
   end
 end


 def turn_count
    @board.count{|token| token == "X" || token == "O"}
 end

 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end
end
