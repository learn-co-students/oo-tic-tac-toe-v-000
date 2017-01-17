require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]]

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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, player)
    @board[position] = player
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count { |x| x == "X" || x == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def won?
    WIN_COMBINATIONS.any? do |combination|
      if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
        return combination
      end
    end
  end

  def full?
    !@board.include? " "
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if combination = won?
      @board[combination[0]]
    end
  end

end
