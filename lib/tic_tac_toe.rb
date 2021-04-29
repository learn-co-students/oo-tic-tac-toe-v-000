class TicTacToe 
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end
  
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Left diagonal
  [2,4,6]  # Right diagonal
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

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  if index.between?(0, 8) && @board[index] == " " || @board[index] == ""
    TRUE
  else
    FALSE
  end
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
  count = 0 
  @board.each do |turn|
    if turn == "X" || turn == "O"
      count +=1
    end
  end
count
end


def current_player
  turn_count % 2 == 0 ? "X" : "O"
end


def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
  end
end

def full?
  @board.all? do |full_board|
    full_board == "X" || full_board == "O"
  end
end

def draw?
  if !won? && full?
    return TRUE
  else
    FALSE
  end
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    win_index = won?[0]
    return @board[win_index]
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

  