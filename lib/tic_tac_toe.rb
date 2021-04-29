class TicTacToe

board = Array.new(9, " ")

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

def input_to_index(x)
   user_input = x.to_i - 1
end

def move (index, value = "X")
  @board[index] = value
end

def position_taken?(index)
  return false if [" ", "", nil].include?(@board[index])
  return true if ["X", "O"].include?(@board[index])
end

def valid_move?(index)
  return true if index.between?(0,8) && position_taken?(index) == false
end

def turn
  puts "Please enter 1-9:"
  number = gets.strip
  index = input_to_index(number)

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
    count += 1
    end
  end
  count
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") ||
    (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
    return win_combination
    else
      false
    end
  end
  false
end

def full?
  if @board.include?(" ")
    return false
  else
    true
  end
end

def draw?
  if full? == true && won? == false
    return true
  elsif won? == false && full? == false
    return false
  else
    false
  end
  false
end

def over?
  if draw? == true
    return true
  elsif won? != false
    return true
  elsif full? == false
    return false
  else
    false
  end
  false
end

def winner
  WIN_COMBINATIONS.each do |win_combination|
    if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X")
      return "X"
    elsif (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
      return "O"
    else
      nil
    end
  end
  nil
end

def play

  until over? == true
    turn
  end

  if draw? == true
    puts "Cat's Game!"
  elsif winner == "X"
    puts "Congratulations X!"
  else
    puts "Congratulations O!"
  end
end

end
