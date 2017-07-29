class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  @index = user_input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(index)

  if index.between?(0,8) && position_taken?(index) == false
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  input = input_to_index(gets.strip)

  if valid_move?(input)
    token = current_player
    move(input, token)
  else
    turn
  end
  display_board
end

def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count.even?
    "X"
  else
    "O"
 end
end

def won?
  WIN_COMBINATIONS.detect do |position|
  if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X"
    position
  elsif @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
    position
  else
    false
  end
 end
end

def full?
  @board.all? do |full_board|
    if full_board == "X" || full_board == "O"
      true
    else
      false
    end
  end
end

def draw?
full? && !won?
end

def over?
  if draw? || won? || full?
    true
  else
    false
  end
end

def winner
  if win_combination = won?
    @board[win_combination.first]
  else
    nil
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
