class TicTacToe
 
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def board=(board)
    @board =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
 
  def board
    @board
  end

   WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # First column
    [1,4,7],  # Middle column
    [2,5,8],  # Last column
    [0,4,8],  # diagnoal one 
    [2,4,6]  # last diagnal 
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  
  
end #end tictactoe class