class TicTacToe
  def initialize(board)
    @board = board || Array.new(9, " ")
  end
  def WIN_COMBINATIONS
    [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #top L to bottom R
    [2, 4, 6]  #top R to bottom L
    ]
  end
  def display_board(board)
    @board
  end
  def input_to_index(user_input)
    move = gets.user_input - 1
  end
  def move(board, index, user_input)
  end
end