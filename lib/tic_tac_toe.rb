require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(location)
    location = location.to_i - 1
    location.between?(0,8) && !position_taken?(location)
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def move(location,current_player="X")
    @board[location.to_i - 1] = current_player
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    location = input.to_i

    if valid_move?(location)
      move(location,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    total = @board.count("X") + @board.count("O")
    total
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      position_one = @board[win_combination[0]]
      position_two = @board[win_combination[1]]
      position_three = @board[win_combination[2]]

      (position_one == "X" && position_two == "X" && position_three == "X") ||
      (position_one == "O" && position_two == "O" && position_three == "O")
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top-row
    [3,4,5], #middle-row
    [6,7,8], #bottom-row
    [0,3,6], #left-column
    [1,4,7], #middle-column
    [2,5,8], #right-column
    [0,4,8], #left to right diagonal
    [2,4,6] #right to left diagonal
  ]

  def full?
    @board.include?(" ") ? false : true
  end

  def draw?
    if self.full? == true && self.won? == nil
      return true
    end
  end

  def over?
    if self.full? || self.won? || self.draw?
      return true
    end
  end

  def winner
    winner_type = self.won? #array of winning combination
    if winner_type == nil
      return nil
    else
      @board[winner_type[0]] #value of first element of winning combination on board
    end
  end

  def play
    until over?
      turn
    end

    if won?
      winner_type = winner[0]
      puts "Congratulations #{winner_type}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
