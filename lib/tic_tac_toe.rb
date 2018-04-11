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
    [6,4,2]
  ]

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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.chomp)
    if valid_move?(index) == true
      player = current_player
      move(index, player)
      display_board
    else
      turn
    end
  end

  def won?
    match = []
    if @board.count("X") > @board.count("O")
      @board.each_with_index do |element, index|
        if element == "X"
          match << index
        end
      end
    elsif @board.count("O") > @board.count("X")
      @board.each_with_index do |element, index|
        if element == "O"
          match << index
        end
      end
    else
      return false
    end
    case
    when WIN_COMBINATIONS[0] & match == WIN_COMBINATIONS[0]
      return WIN_COMBINATIONS[0]
    when WIN_COMBINATIONS[1] & match == WIN_COMBINATIONS[1]
      return WIN_COMBINATIONS[1]
    when WIN_COMBINATIONS[2] & match == WIN_COMBINATIONS[2]
      return WIN_COMBINATIONS[2]
    when WIN_COMBINATIONS[3] & match == WIN_COMBINATIONS[3]
      return WIN_COMBINATIONS[3]
    when WIN_COMBINATIONS[4] & match == WIN_COMBINATIONS[4]
      return WIN_COMBINATIONS[4]
    when WIN_COMBINATIONS[5] & match == WIN_COMBINATIONS[5]
      return WIN_COMBINATIONS[5]
    when WIN_COMBINATIONS[6] & match == WIN_COMBINATIONS[6]
      return WIN_COMBINATIONS[6]
    when WIN_COMBINATIONS[7] & match == WIN_COMBINATIONS[7]
      return WIN_COMBINATIONS[7]
    else
      return false
    end
    # I almost got this working too...
    # WIN_COMBINATIONS.each_with_index do |element, index|
    #     if (WIN_COMBINATIONS[index]) & match == WIN_COMBINATIONS[index]
    #         return WIN_COMBINATIONS[index]
    #     else
    #       return false
    #     end
    #   end
  end

  def full?
    if @board.any? { |space| space == " " }
      return false
    elsif @board.all? { |space| space == "X" || space == "O" }
      return true
    end
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if !full? && won?
      return true
    elsif !full? && !won?
      return false
    elsif draw?
      return true
    elsif full? && (won? != false)
      return true
    end
  end

  def winner
    if won? && (@board.count("X") >= 3)
      return "X"
    elsif won? && (@board.count("O") >= 3)
      return "O"
    elsif won? || draw?
      return nil
    end
  end

  def play
    until over? || draw?
      turn
    end

    if winner == "X" || winner == "O"
      puts "Congratulations #{winner.strip}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end

end

#
# index = 0
# player = "X"
# @board = []


# def position_taken?(board, location)
#   board[location] != " " && board[location] != ""
# end
