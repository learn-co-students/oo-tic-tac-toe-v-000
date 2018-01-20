class TicTacToe

def initialize (board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Top Left to Bottom right diagonals
  [2,4,6], # Top right to bottom left diagonals
  [1,4,7], # Middle Up/Down
  [0,3,6], # Left Up/Down
  [2,5,8]  # Right Up/Down
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index (user_input)
  user_input = user_input.to_i - 1
end

def move(index, token = "X")
 @board[index] = token
end

def position_taken?(index)
  @board[index] != nil && @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    true
  end
end

def turn_count
 @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  user_input = gets
  user_input = input_to_index(user_input)
  index = user_input

  if valid_move?(index)
    token = current_player
    move(index, token)
    display_board
  else
    puts "Invalid Move!"
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
         return combo
    end
  end
return false
end

def full?
  @board.all? do |combo|
    if combo == "X" || combo == "O"
      true
    end
  end
end

def draw?
  (!won? && full?)?  true : false
end

def over?
  (won? || draw? || full?)? true : false
end

def winner
  winner_token = won?
  (winner_token)? @board[winner_token[0]] : nil
end

def play
  turn until over?
  (won?)? puts("Congratulations #{winner}!") : puts("Cat's Game!")
end

end
