class TicTacToe

WIN_COMBINATIONS =  [ [0,1,2], #top
  [3,4,5], #middle
  [6,7,8], #bottom
  [0,4,8], #left cross
  [2,4,6], #right cross
  [0,3,6], #left line
  [2,5,8], #right line
  [1,4,7] #center line
]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index (input)
  index = input.to_i - 1
end

def move (index, token="X")
  @board[index] = token
end

def position_taken? (index)
  if @board[index] == "  " || @board[index] == " " ||  @board[index] == nil ||  @board[index] == ""
    return false
  else
    return true
  end
end


def valid_move? (index)
  if position_taken?(index) == false
    if index.between?(0,8)
      return true
    end
    else
    return false
  end
end

def turn_count
  counter = 0
  @board.each do |turn|
    if turn != " "
      counter += 1
    end
  end
  return counter
end

def current_player
  turn = turn_count
  if turn.even?
   return "X"
  elsif turn.odd?
    return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  value = current_player
  if valid_move?(index)
    move(index, value)
    display_board
  else
     turn
  end
end

def won?
  WIN_COMBINATIONS.find do | pattern |
    @board[pattern[0]] == @board[pattern[1]] && @board[pattern[1]] == @board[pattern[2]] &&
    position_taken?(pattern[0])
   end
end

def full?
  @board.all? do | position |
     position != " "
  end
end

def draw?
   !won? && full?
end

def over?
  won? || draw?|| full?
end

def winner
  if win_result = won?
     @board[win_result[0]]
  end
end

def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end



end
