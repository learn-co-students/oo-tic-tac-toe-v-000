
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
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

def move(index, character)
  @board[index] = character
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end


def turn_count
  count = 0
  @board.each do |space|
    if space != " "
      count += 1
    end
    end
    count
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect { |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] &&
    @board[win_combination[1]] == @board[win_combination[2]] &&
    position_taken?(win_combination[0])
  }
end

def full?
  @board.all? do |space|
      space == "X" || space == "O"
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
    puts "Cat's Game!"
  end
 end
end
