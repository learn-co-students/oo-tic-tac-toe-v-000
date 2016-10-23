require 'pry'

class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [2, 4, 6], # Diagonal 1
    [0, 4, 8]  # Diagonal 2
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, playa)
    @board[index.to_i-1] = playa
  end

  def position_taken?(index)
    !(@board[index.to_i-1].nil? || @board[index.to_i-1] == " ")
  end

  def valid_move?(position)
    #binding.pry
    if position.to_i.between?(0,8) && !position_taken?(position.to_i)
      return true
    end
  end
end
