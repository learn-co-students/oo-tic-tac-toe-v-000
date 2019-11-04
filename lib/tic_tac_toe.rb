require 'pry'
class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(position)
    !position_taken?(position) && position.between?(0,9) ? true : false
  end

  def turn_count
    @board.count {|cell| cell != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Enter move 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      input = gets.strip
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]]
        return combo
      else
        false
      end
    end
  end

  def full?
    @board.all? {|cell| cell != " "}
  end

  def draw?
    full? && won? == false ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    if win_combo = won?
      @board[win_combo[0]]
    end
  end

  def play
    turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end
