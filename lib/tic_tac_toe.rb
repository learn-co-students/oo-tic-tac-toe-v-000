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
    [2,4,6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
  counter
  end


def current_player
  if turn_count.even?
    "X"
  else
    "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(index)
    token = current_player
  else
    turn
  end
  move(index, token)
  display_board



end

def won?
  #returns first matching array in WIN_COMBINATIONS where ["X","X","X"] or ["O","O","O"]
  #the winning marker of the game would simply be any element from the winner variable: winner.first
  #method is thinking a combo of [" ", " ", " "] is a winner
  WIN_COMBINATIONS.detect do |var|
    if @board[var[0]] == @board[var[1]] &&
       @board[var[1]] == @board[var[2]]
    return var
    end
  end
end

def draw?

end

def full?

end

def over?


end

def winner
  if winning_combination = won? #method is thinking a combo of [" ", " ", " "] is a winner
    binding.pry
    @board[winning_combination.first]
  end
end



end
