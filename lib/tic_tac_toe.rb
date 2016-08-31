class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [2,4,6]
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end


  def move(index, character)
    @board[index - 1] = character
    @board
  end

  def position_taken?(index)
    if !(@board[index].nil? || @board[index] == " ")
      true
    else
      false
    end
  end

  def between?(index)
    index >= 0 && index <= 8
  end

  def valid_move?(index)
    if position_taken?(index) || !between?(index)
      false
    else
      true
    end
  end

end
