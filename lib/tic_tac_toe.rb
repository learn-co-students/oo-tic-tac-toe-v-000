class TicTacToe

def board=(board)
  @board = name
end

def board
  @board
end

def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS =  [
  [0,1,2], # Top row
 [3,4,5],  # Middle row
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [6,4,2]
]

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(position, token)
  index = position.to_i - 1

  @board[index] = token
end

def position_taken?(position)
  if (@board[position] == "X" || @board[position] == "O")
    return true
  else return false
  end
end

def valid_move?(position)
position = position.to_i - 1
  if !position_taken?(position) && position.between?(0,8)
    return true
  else return false
  end
end

def turn
  puts "Please select: 1-9"
  position = gets.strip
  if valid_move?(position)
    move(position, current_player)
    display_board
  elsif !valid_move?(position)
    turn
  end
end

def turn_count
number_turns = 0
  @board.each do |token|
    if token != " "
      number_turns += 1
end
end
number_turns
end

def current_player
  if turn_count % 2 == 0
    "X"
  else "O"
  end
end

def won?
WIN_COMBINATIONS.detect do |win_combination|
      if  board[win_combination[0]] == board[win_combination[1]] &&
        board[win_combination[1]] == board[win_combination[2]] &&
        (board[win_combination[0]] == "X" || board[win_combination[0]] == "O")
        return win_combination
      else
        false
      end
    end
end

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  !won? && full?
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    win_combo = won?
  return @board[win_combo[0]]
  end
end

def play
while !over?
turn
end
if won?
  puts "Congratulations #{winner}!"
elsif draw?
  puts "Cats Game!"
end
end

end
