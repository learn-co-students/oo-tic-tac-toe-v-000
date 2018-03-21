require 'pry'

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

class TicTacToe
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
  index = input.to_i - 1

  end

  def move(index,token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9"
    input = gets.strip
    index = input.to_i - 1
    input_to_index(input)
      if valid_move?(index)
      move(index,current_player)
      display_board
    else
      puts "Invalid input"
    turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def current_player
      if turn_count.even?
      "X"
      else
      "O"
      end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|


    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" || position_1 == "O"
    win_combination
    else
      false
    end
  end

  def full?
      @board.all? do |letter|
    if letter == "O" || letter == "X"
      true
      end
    end
  end


  def draw?
      !won? && full?
    end
  end

  def over?
    won? || draw?
    end


  def winner?
    WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if won? && position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    else won? && position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
  end
  nil
  end
end
end
