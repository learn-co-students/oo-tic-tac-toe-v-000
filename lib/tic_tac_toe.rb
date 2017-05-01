class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row win
    [3,4,5], #middle row win
    [6,7,8], #bottom row win
    [0,3,6], #left column win
    [1,4,7], #middle column win
    [2,5,8], #right column win
    [0,4,8], #diagonal win left top to right bottom
    [2,4,6], #diagonal win right top to left bottom
  ]
#unmodified

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
#replaced board[] with @board and removed argument

  def input_to_index(user_input)
    user_input.to_i - 1
  end
# unmodified

  def move(board, token = "X")
    @board = token
  end
  #move needs to output the array not the value of token - needs work

  def position_taken?
    !(@board == " " || @board == "" || @board == nil)
  end
#removed arguments from original method, removed board[array] and replaced with instance variable @board - needs work

  def valid_move?(board, index)
    index.between?(0, 8) && !(position_taken?(board, index))
  end

  def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index) == true
       move(board, index, current_player(board))
    else
      turn(board)
    end
  display_board(board)
  end

  def turn_count(board)
    board.count{|i| i != " "}
  end

  def current_player(board)
    if turn_count(board) % 2 == 0
      "X"
    else
      "O"
    end
  end
end
