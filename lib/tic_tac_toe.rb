class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #Top Row
    [3, 4, 5], # Middle Row
    [6, 7, 8], #Bottom Row
    [0, 4, 8], #Diagonal L
    [2, 4, 6], #Diagonal R
    [0, 3, 6], #Down L
    [1, 4, 7], #Down M
    [2, 5, 8] #Down R
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      return false
    elsif  @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      return nil
    elsif index >= 0  && index <= 8
      return true
    else
      return nil
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
    current_player
    move(index, character = "X")
    display_board
    else
    turn
   end
  end

#  def won?
#    if WIN_COMBINATIONS

#  end

  def won?
    WIN_COMBINATIONS.detect do |path|
      @board[path[0]] == @board[path[1]] &&
      @board[path[1]] == @board[path[2]] &&
      position_taken?(board, path[0])
    end
  end
