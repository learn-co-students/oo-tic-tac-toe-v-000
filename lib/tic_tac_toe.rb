class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
user_input.to_i - 1
end

def move(index,value="X")
@board[index] = value
end

def position_taken?(index)
  if      @board[index] == " " || @board[index] == "" || @board[index] == nil then false
  elsif
  @board[index] == "X" || @board[index] == "O" then true
end
end

def valid_move?(index)
  if index.between?(0,8) && @board[index] == " " then true
  else false
  end
end

def turn_count
  counter = 0
  @board.each {|i|
  if i != " " then
  counter += 1
end}
  return counter
end

def current_player
  if turn_count.odd? then "O"
  else "X"
  end
end

def turn
  puts "Please enter a number (1-9):"
  user_input = gets
  index = input_to_index(user_input)
  if valid_move?(index) == true then
    value = current_player
    move(index, value)
  else turn
  end
  display_board
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

def full?
 @board.all?{|token| token == "X" || token == "O"}
end


def draw?
  full? && !won?
end

def over?
  won? || full?
end

def winner
    if combo = won?
      @board[combo[0]]
    end
  end

def play
  turn until over? || draw?
  puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
end

end
