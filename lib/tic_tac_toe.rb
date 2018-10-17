# this class is the blueprint for each game, defining objects and behaviors
class TicTacToe

#every instance of this class will begin with its own board array instance variable of 9 spaces of empty strings
  def initialize
    @board = Array.new(9, " ")
  end

#this constant declares combinations of indexes that produce a winner
  WIN_COMBINATIONS = [
  [0,1,2], #row-wins
  [3,4,5],
  [6,7,8],

  [0,3,6], #column-wins
  [1,4,7],
  [2,5,8],

  [0,4,8], #diagonal-wins
  [2,4,6]
  ]


#method uses strings and interpolation of the board array variable to create a visual ASCII game board
def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?
  index == "X" || index == "O"
end

end
