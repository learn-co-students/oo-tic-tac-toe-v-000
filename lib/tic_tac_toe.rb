require 'pry'

class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
      puts "Please enter 1-9:"
      input = gets.strip
#      input = input_to_index(input)
#      binding.pry
      if valid_move?(input)
        #turn_count
        #current_player = current_player
        move(input, current_player)
        display_board
      else
        turn
      end
    end

  WIN_COMBINATIONS =
    [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

#  def input_to_index( input)
#    input = input.to_i-1
#  end

  def move (input, current_player = "X")
    #input = input.to_i-1
    @board[input.to_i-1] = current_player
  end

  def over?
    if full? || draw? || won?
      true
    else
      false
    end
  end

  def draw?
    if full? && !won?
      true
    else won?
      false
    end
  end

  def winner
    winning_combo = won?
    if winning_combo
      winning_index = winning_combo[0]
      return @board[winning_index]
    else
      nil
    end
  end

  def full?
    @board.all?{|positions| positions == "X" || positions == "O"}
  end

  def current_player
#    turn_count % 2 == 0 ? "X" : "O"
    output = turn_count
      if output % 2 == 0
        return "X"
      else
        return "O"
      end
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end



  def won?
    WIN_COMBINATIONS.find do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        return win_combination
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        return win_combination
      else
        false
      end
    end
  end

  def position_taken?(input)
    @board[input] != " " && @board[input] != ""
  end

  def valid_move?( input)
    input = input.to_i
#    input.between?(0,8) && !position_taken?(input)
    input.between?(1,9) && !position_taken?(input-1)
    #binding.pry
  end



end


#-----------------------------------------------------
