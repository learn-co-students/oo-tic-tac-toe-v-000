class TicTacToe

def initialize(board = nil)
  @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
[0,1,2],#top row
[3,4,5],#middle row
[6,7,8],#bottom row
[0,3,6],#left column
[1,4,7],#middle column
[2,5,8],#right column
[0,4,8],#diagonal 1
[2,4,6]
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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == "" || @board[index] == " "
    false
  else true
  end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    true
  else false
  end
end

def turn_count
turn_number = 0
@board.each do |char|
  if char == "X" || char == "O"
    turn_number +=1
  end
end
turn_number
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def turn
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  validation = valid_move?(index)
  if validation
    move(index, current_player)
  else
    turn
  end
  display_board
end

def won?
WIN_COMBINATIONS.detect do |win_combo|
  win_1 = win_combo[0]
  win_2 = win_combo[1]
  win_3 = win_combo[2]

  position1 = @board[win_1]
  position2 = @board[win_2]
  position3 = @board[win_3]

  position1 == "X" && position2 == "X" && position3 == "X" || position1 == "O" && position2 == "O" && position3 == "O"

  end
end

def full?
  !@board.include?(" ")
end

def draw?
  if full? && !won?
    true
  else false
end
end

def over?
  if draw? || won? || full?
    true
  end
end

def winner
  combo = won?
  if combo
    @board[combo.first]
  end
end

def play
  if !over?
    turn
    play
  elsif draw?
    puts "Cat's Game!"
  elsif won?
    puts "Congratulations #{winner}!"
  end
end


end
