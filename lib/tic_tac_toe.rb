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
    [6,4,2] #[2,4,6] would have been my choice
  ]

  def initialize(board = nil)
    @board = nil || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #spec problems: position is ambiguous

  def move(position, token = "X")
    @board[position - 1] = token
  end

  def position_taken?(position)
    @board[position] == "X" ||
    @board[position] == "O"
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && 
    !position_taken?(position.to_i - 1)
  end

  def turn
    puts "gimme dat input"
    input = gets.strip
    if valid_move?(input) 
      move(input.to_i, current_player)
    else 
      puts "invalid, try again"
      turn
    end
  end

  def turn_count
    @board.count do |token|
      token == "X" || token == "O"
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    return false
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw? #ugh shouldn't have to do this
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end



end
















