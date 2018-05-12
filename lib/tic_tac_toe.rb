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
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1 #gets user input, subtracts one to coincide with board array index
  end
  
  def move(board, index, token)
    
  end

  def position_taken?(index)
    if index == "X" || index == "O"
      false
    end
  end

  def valid_move?(index)
    if user_input == (0..9) && position_taken?(index) == false
      true
    end
  end
  
  def turn
    
  end

  def turn_count
    @board.count{| token | token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    
  end
  
  def full?(board)

  end

  def draw?(board)
  end

  def over?(board)
  end
  
  def winner?(board)
  end

end