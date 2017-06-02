class TicTacToe
def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

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

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  @new = user_input.to_i - 1
  return @new
end

def move(input_to_index, char = "X")
  @board[input_to_index] = char
end

def position_taken?(input_to_index)
  !(@board[input_to_index].nil? || @board[input_to_index] == " ")
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  @index = input_to_index(user_input)
  if valid_move?(@index)
    move(@index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    if (@board[win_combination[0]]) == "X" && (@board[win_combination[1]]) == "X" && (@board[win_combination[2]]) == "X" || (@board[win_combination[0]]) == "O" && (@board[win_combination[1]]) == "O" && (@board[win_combination[2]]) == "O"
      return win_combination
    end
  end
  return false
end

def full?
  @board.all? do |x|
  if x == "X" || x == "O"
    true
  else
    false
  end
  end
end

def draw?
  if full? == true && won? == false
    true
  elsif full? == false && won? == false
    return false
  else won? == true
    return false
  end
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    win_1 = @board[won?[0]]
  end
end


def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end

end
