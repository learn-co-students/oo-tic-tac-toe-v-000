#require 'pry'

class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end
#binding.pry

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

  game.move (index, current_player)
    @board[@index] = current_player
  end

  def over?
    if full?( @board) || draw?( @board) || won?( @board)
      true
    else
      false
    end
  end

  def draw?
    if (full?( @board) && !won?( @board))
      true
    else won?( @board)
      false
    end
  end

  def winner
    winning_combo = won?( @board)

  end

  def full?
    @board.all?{|positions| positions == "X" || positions == "O"}
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        count += 1
      else
        counter = counter
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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
end

def play
  until over?( @board)
    turn( @board)
  end
  if won? (@board)
    puts "Congratulations #{winner(@board)}"
  elsif draw? ( @board)
    puts "Cats Game!"
  end
end

def turn
  puts "Please enter 1-9:"
  @input = gets.strip
  @index = input_to_index

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

def valid_move?
  index.between?(0,8) && !position_taken?(@board,@index)
end
