require 'pry'
class TicTacToe
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

  # Define your play method below
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def valid_move?(index)
    index.between?(0,8) && !(position_taken?(index))
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def full?
    @board.all?{ |e| e == "X" || e == "O"}
  end

  def draw?
    if full? && !won?
      return true
    elsif won?
      return false
    elsif !won? && !full?
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |item|
      if @board[item[0]] == "X" && @board[item[1]] == "X" && @board[item[2]] == "X"
        return item
      elsif @board[item[0]] == "O" && @board[item[1]] == "O" && @board[item[2]] == "O"
        return item
      end
    end
    return false
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    winner = won?
    winner ? @board[winner[0]] : nil
  end
end
