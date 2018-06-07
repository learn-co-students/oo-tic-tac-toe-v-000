class TicTacToe

require "pry"

def initialize(board= nil)
  @board = board || Array.new(9," ")

end

WIN_COMBINATIONS= [
[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]


def display_board

  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end



def move(index,choice)

@board[input_to_index(index)]=choice

end

def position_taken?(index)
  if @board[index] == " "
    false
  elsif @board[index] == ""
    false

  elsif @board[index] == nil
    false
  else @board[index] == "X"||"O"
    true
  end
end

def input_to_index(input)
  input.to_i-1

end

def turn_count
    counter = 0
@board.each do|player|

  if player == "X"
    counter += 1
  elsif player == "O"
    counter +=1

  end

  end
counter
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

def valid_move?(index)
  index = input_to_index(index)
  !position_taken?(index) && index.between?(0,8)

end

def turn

  puts "Please enter 1-9:"
  input= gets.strip

  if valid_move?(input)
    move(input,current_player)
    display_board
    else
      turn
  end

end

def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.none? do |board|
      board == " "
    end
  end

def draw?
  !won? && full?

end

def over?
  won? || full? || draw?

end

def winner
  if won?
    @board[won?[0]]
  end

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

end
