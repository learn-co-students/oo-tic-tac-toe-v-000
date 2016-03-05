class TicTacToe

def initialize
  @board = Array.new 9, " "
end

# Define your WIN_COMBINATIONS constant
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
  print "  #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
  print " -----------\n"
  print "  #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
  print " -----------\n"
  print "  #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
end

def move(position, value ="X")
  @board[position.to_i - 1] = value
  return @board
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return false
  else
    return true
  end
end

def valid_move?(position)
  position = position.to_i - 1
  if position.between?(0, 8) && !(position_taken?(position))
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input) == true
    move(input, current_player)
  else puts "Please enter 1-9:"
    input = gets.strip
    move(input, current_player)
  end
  display_board
end

def turn_count
  turn_count = 0
  @board.each do |value|
    if value != " "
      turn_count += 1
    end
  end
  return turn_count
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end


def won?
  WIN_COMBINATIONS.each do |combo|
    if (combo.all? {|index| @board[index] == "X"}) || (combo.all? {|index| @board[index] == "O"})
      return combo
    end
  end
  return false
end

def over?
  won? || draw?
end

def full?
  @board.each.all? {|value| value == "X" || value == "O"}
end

def draw?
  full? && won? == false
end

def winner
  return @board[won?.first] if won?
end

def play
  display_board
  while !(over?)
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end



end
