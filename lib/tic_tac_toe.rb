# helper methods
require 'pry'

class TicTacToe
  attr_accessor :board, :input

  def initialize
    @board = Array.new( 9, " ")
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

  def display_board
    puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
    puts "-----------"
    puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
    puts "-----------"
    puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token = "X")
    self.board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    @board.count { |token| token != " " }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      position_1 = @board[win_combo[0]]
      position_2 = @board[win_combo[1]]
      position_3 = @board[win_combo[2]]

      position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
  end

  def full?
    @board.all? { |position| position != " " }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    winner = won?
    if winner
      @board[winner[0]]
    end
  end

  def play
    until over? # until the game is over
      turn #   take turns
    end # end

    if won? # if the game was won
      puts "Congratulations #{winner}!" #   congratulate the winner
    else  # else if the game was a draw
      puts "Cat's Game!" #   tell the players it has been a draw
    end
  end
end
