class TicTacToe
  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
     @board = board
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
 end
 
 class  DisplayBoard 
   def initialize(board)
     @board = board 
  end
   def board
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
    separator = "-----------"
    puts separator
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts separator
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
   end
end
   
   
   
   