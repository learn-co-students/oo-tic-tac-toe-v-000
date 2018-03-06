class TicTacToe
  def initialize(board=[" ", " ", " "," ", " ", " "," "," "," "])
    @board = board
  end
  
 WIN_COMBINATIONS = [
 [0,1,2], # Top row
 [3,4,5], # Middle row
 [6,7,8], # Bottom row
 [0,3,6], # First column
 [1,4,7], # Second column
 [2,5,8], # Third column
 [0,4,8], # Left diagonal
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

def move(index, token)
    @board[index] = token
  end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
   false
   elsif @board[index] == "X" || @board[index] == "O"
   true
  end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    # value = current_player(board)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
    @board.each do |turn_count|
      if turn_count == "X" || turn_count == "O"
      counter += 1
      end
    end
  counter
end

def current_player
      if turn_count % 2 == 0
        "X"
      else
        "O"
    end
end 

def won?
  WIN_COMBINATIONS.find do |win_combo|
  @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
  end
end

def full?  
  @board.all?{ |token| token == "X" || token == "O" }
end

def draw?
  !won? && full?
end

def over?
  won? || draw? || full?
end

def winner
  if win_combo = won?
    @board[win_combo.first]
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