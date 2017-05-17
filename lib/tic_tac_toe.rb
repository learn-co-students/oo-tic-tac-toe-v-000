class TicTacToe
  def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

   WIN_COMBINATIONS = [
     [0,1,2], #top row
     [3,4,5], #middle row
     [6,7,8], #bottom row
     [0,3,6], #first column
     [1,4,7], #middle column
     [2,5,8], #bottom column
     [0,4,8], #first diagonal
     [6,4,2]  #second diagonal
   ]

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end



end
