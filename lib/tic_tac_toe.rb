class TicTacToe
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end
attr_accessor :board

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # From index 0 straight down left
  [1,4,7], # From index 1 straight down center
  [2,5,8], # From index 2 straight down right
  [2,4,6], # From index 0 diagonal to index 8
  [0,4,8] # From index 2 diagonal to index 6
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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if !valid_move?(index) #couldn't figure this part out
      turn
  else
    move(index, current_player)
    display_board
  end
end

def turn_count
  count = 0
  @board.each do |index|
    if index == "X" || index == "O"
      count += 1
    end
  end
    count #needed this, changed from turn_count to count
end

def current_player
  if turn_count % 2 == 0 #removed (board)
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[2]] == @board[win_combination[1]] && position_taken?(win_combination[0])
  end
end

def full?(board)
  WIN_COMBINATIONS.all? do |turn| #review .all method
    position_taken?(board, turn[0])
  end
end


def draw?
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

def winner
  WIN_COMBINATIONS.detect do |win_combination|
    if (@board[win_combination[0]]) == "X" && (@board[win_combination[1]]) == "X" && (@board[win_combination[2]]) == "X"
        return "X"
      elsif (@board[win_combination[0]]) == "O" && (@board[win_combination[1]]) == "O" && (@board[win_combination[2]]) == "O"
        return "O"
      end
    end
  end

def play
  until over?(board) || won?(board) #= true
    turn(board)
    end
    if draw?(board)
      puts "Cats Game!"
    elsif won?(board)
      puts "Congratulations!"
    end
  end
end

#lab needs work and I realize I don't like tic tac toe...
