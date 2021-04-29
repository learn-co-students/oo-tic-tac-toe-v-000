WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

class TicTacToe
  attr_accessor :board
  #This is the initializer where we declare our instance board variable with 9 empty strings
  def initialize(board=Array.new(9," "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count { |ele| ele == "X" || ele == "O" }
  end

  def current_player
     turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter a valid move from 1-9:"
    input = gets.chomp
    index = input_to_index(input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "invalid"
      turn
    end
  end

  #=========================================================

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |ele| @board[ele] == "X" }
        return combo
      end
      if combo.all? { |ele| @board[ele] == "O" }
        return combo
      end
    end
    false
  end

  def draw?
    if won?.is_a? Array
      false
    elsif full?
      puts "Cat's Game!"
      true
    end
  end

  def full?
    @board.all? { |ele| ele != " " }
  end

  def over?
    draw? || won?
  end

  def winner
    if won? != false
      if @board[won?[0]] == "X"
        puts "Congratulations X!"
        return "X"
      else
        puts "Congratulations O!"
        return "O"
      end
    end
    nil
  end

  def play
    until over?
      turn
    end
    winner
  end

end # end class
