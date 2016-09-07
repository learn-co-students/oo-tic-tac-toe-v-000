require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, value= "X")
    @board[position - 1] = value
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(input)
    input = input.to_i
    if input.between?(1, 9) && !position_taken?(input - 1)
        true
      else
        false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input = input.to_i
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
  @board.count {|space| space != " "}
  end

  def current_player
    counter = 0
    if turn_count % 2 == 0
      value = "X"
    else
      value = "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
  	if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
          return win_combo
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
          return win_combo
      else
        false
    	end
    end
  end

  def full?
    @board.all? do |positions|
      positions == "X" || positions == "O"
    end
  end

  def draw?
  !won? && full?
  end

  def over?
    if won? || full? || draw?
      true
    end
  end

  def winner
    WIN_COMBINATIONS.find do |win_combo|
  	if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
          return "X"
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
          return "O"
      else
    	end
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cats Game!"
    end
  end



end
