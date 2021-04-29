require 'pry'

class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i-1
  end

  def move(index,token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    index >= 0 && index <= 8 && position_taken?(index) == false
  end

  def turn_count
    @board.select {|position| position != " "}.count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please select a space between 1 and 9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) && !position_taken?(index)
      token = current_player
      move(index,token)
      display_board
    else
      puts "Invalid move."
      display_board
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && @board[win_combo[0]] != " "
    end
  end

  def full?
    turn_count == 9 ? true : false
  end

  def draw?
    full? and !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    won? ? (puts "Congratulations #{winner}!") : false
    draw? ? (puts "Cat's Game!") : false
  end

end
