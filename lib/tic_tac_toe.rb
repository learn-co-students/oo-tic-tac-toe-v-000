require "pry"
class TicTacToe
  #Remember to ALWAYS captialize a class
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

    WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Diagonal downward right
    [2,4,6] #Diagonal downward left
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

  def move(index,current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      #^THIS WORKS WITHOUT CALLING
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
      WIN_COMBINATIONS.each do |combination|
        @index1 = combination[0]
        @index2 = combination[1]
        @index3 = combination[2]
        @position_1 = @board[@index1]
        @position_2 = @board[@index2]
        @position_3 = @board[@index3]
        if @position_1 == "X" && @position_2 == "X" && @position_3 == "X"
          return combination # return the win_combination indexes that won.
        elsif @position_1 == "O" && @position_2 == "O" && @position_3 == "O"
          return combination
        end
      end
      false
  end


  def full?
      if @board[0] == " "
        false
      elsif @board[1] == " "
        false
      elsif @board[2] == " "
        false
      elsif @board[3] == " "
        false
      elsif @board[4] == " "
        false
      elsif @board[5] == " "
        false
      elsif @board[6] == " "
        false
      elsif @board[7] == " "
        false
      elsif @board[8] == " "
        false
      else
        true
      end
  end


  def draw?
    !won? && full?
   end

  def over?
    won?
    draw?
    full?

    if draw?
      return true
    elsif won? && full?
      return true
    elsif won? && !full?
      return true
    else
      return false
    end
  end

  def winner
     won?
     if won?
      (won?).each do |position|
        @position = position
        @board[@position]
        if @board[@position] == "X"
          return "X"
        elsif @board[@position] == "O"
          return "O"
        end
      end
    else
      nil
    end
  end

  def play
    until over?
      turn
      turn_count
    end
    won?
    if won?
      winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end

end
