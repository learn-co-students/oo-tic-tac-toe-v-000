class TicTacToe
  def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
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

def move(index, player)
@board[index] = player
end

def position_taken?(position)
	@board[position] == "X" || @board[position] == "O"
end

def valid_move?(position)
	position.between?(0, 8) && !position_taken?(position)
end

def turn_count
	@board.count{ |item| item == "X" || item == "O"}
end

def current_player
if turn_count.even?
	"X"
else
	"O"
end
end

def turn
puts "Please input a number (1-9):"
input = gets.strip
index = input_to_index(input)
if valid_move?(index)
move(index, current_player)
display_board
else
	turn
end
end

def won?
  WIN_COMBINATIONS.find do |win_combo|
    @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[1])
  end
end

def full?
	@board.all?{ |item| item == "X" || item == "O"}
end

def draw?
full? && !won?
end

def over?
draw? || won?
end

def winner
combo = won?
if combo
@board[combo[0]]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end
