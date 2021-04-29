class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # bottom row
  [0,4,8], # diagonal
  [2,4,6], # diagonal
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
 (input.to_i) - 1
end

def move(index, player_character)
  @board[index] = player_character
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player_character = current_player
  if valid_move?(index)
    move(index, player_character)
    display_board
  else
    turn
end
end

def turn_count
counter = 0
@board.each do |turn|
  if turn != " "
counter += 1
  end
end
counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  elsif turn_count % 2 == 1
    return "O"
  end
end

def won?
WIN_COMBINATIONS.each do |win_combo|
    index_1 = @board[win_combo[0]]
    index_2 = @board[win_combo[1]]
    index_3 = @board[win_combo[2]]

       if index_1 == "X" && index_2 == "X" && index_3 =="X"
         return win_combo
       elsif index_1 == "O" && index_2 == "O" && index_3 =="O"
         return win_combo
       end
     end
     false
   end

def full?
  @board.all? {|position| position == "X" || position == "O"}
end

def draw?
  if full? && !won?
    return true
end
end

def over?
  if draw? || won? ||  full?
    return true
end
end

def winner
if win_index = won?
  @board[win_index.first]
end
end

def play
  until over?
    turn
    end
  if won?
    winning_combo = won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
end
end

end
