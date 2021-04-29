class TicTacToe

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3 ,6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(index, value)
  @board[index] = value
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end

def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8)
    true
  else
    false
  end
end

def turn_count
  counter = 0
  @board.each do |space|
    if space == "X" || space == "O"
      counter +=1
  end
end
return counter
end

def current_player
  if turn_count%2 ==0
    current_player = "X"
  else
    current_player = "O"
end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index) == false
    turn
  else
    move(index, current_player)
  end
  display_board
end

def won?
  WIN_COMBINATIONS.detect do |combo|
  win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]

  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]

   if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
    return combo
   end
  end
  return false
end

def full?
  @board.all? {|space| space == "O" || space == "X"}
end

def draw?
  if won? == false && full? == true
    return true
  else
    return false
  end
end

def over?
  if won? != false || draw? == true || full? == true
    return true
  end
end

def winner
  win = won?
  if win && @board[win[0]] == "X"
    return "X"
  elsif win && @board[win[0]] == "O"
    return "O"
  end
end

def play
  until over? == true
    turn
  end
  if winner == "X"
     puts "Congratulations X!"
  elsif winner == "O"
     puts "Congratulations O!"
  elsif draw?
     puts "Cat's Game!"
  else
     return nil
  end
 end

end
