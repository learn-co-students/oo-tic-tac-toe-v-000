class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")

    WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # Left Column
    [1,4,7], # Middle Column
    [2,5,8], # Right Column
    [2,4,6], # Diagonal Right Corner
    [0,4,8] # Diagonal Left Corner
    ]

    end
end
