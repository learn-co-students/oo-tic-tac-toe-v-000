require "pry"
class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8],[6,4,2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
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

  def position_taken?(input)
    @board[input] == "X" || @board[input] == "O"
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index) # or @board[index] == " "
  end

  def turn_count
      @board.count {|index| index != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input = input_to_index(input)
      if valid_move?(input)
      move(input, current_player)
      display_board
      else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      @board[array[0]] == @board[array[1]] &&
      @board[array[2]] == @board[array[0]] &&
      position_taken?(array[0])
    end
  end

  def full?
    @board.all? {|index| index != " "}
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    winning_array = won?
    if winning_array !=nil
      @board[winning_array[0]]
    else
      nil
    end
  end

  def play
    while !(over?)
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
