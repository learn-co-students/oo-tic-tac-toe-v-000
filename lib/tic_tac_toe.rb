class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

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

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |position|
    if position != " "
      counter += 1
    end
  end
  counter
end

def current_player
  turn_count.even? ? "X" : "O"
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def won?
  WIN_COMBINATIONS.detect do |position|
      @board[position[0]] == @board[position[1]] && @board[position[1]] == @board[position[2]] && @board[position[2]] != " "
  end
end

def full?
  @board.include?("X" || "O")
  !@board.include?(" ")
end

def draw?
  full? && !won?
end

def over?
  won? || full? || draw?
end

def winner
    if won? == nil || @board[won?.first] != "X" && @board[won?.first] != "O"
      return nil
    elsif @board[won?.first] == "X"
      return "X"
    else "O"
    end
  end
  
  def play
  turn until over?
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cat's Game!"
  else
  end
end
end


