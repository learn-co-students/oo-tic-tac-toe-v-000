class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end

#constants
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

#Methods

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position,token="X")
  @board[position-1] = token
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] ==nil
    false
  else
    true
  end
end

def valid_move?(index)
  index=index.to_i
  if !position_taken?(index) && index.between?(0,8)
    true
  end
end

end
