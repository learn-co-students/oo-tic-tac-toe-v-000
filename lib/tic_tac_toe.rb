class TicTacToe

def initialize(board = Array.new(9, " "))
  @board = board
end

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

def move(index, position = "X")
  @board[index] = position
end

def position_taken?(index)
  character = @board[index]
  if character == "X" || character == "O"
    return true
  else
    return false
  end
end

def valid_move?(index)

  if 0 <= index && index <= 8
    within_index = true
  else
    within_index = false
  end

  if position_taken?(index) == true
    occupied = true
  else
    occupied = false
  end

  if within_index == true && occupied == false
    return true
  else
    return false
  end

end


def turn

puts "Please enter 1-9:"
input = gets
index = input_to_index(input)

if valid_move?(index) == false
  turn
end

move(index, current_player)
display_board

end

def current_player
  turns = turn_count
  if turns % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn_count
  turns = 0
  @board.each do | xoro |
    if xoro == "X" || xoro == "O"
      turns += 1
    end
  end
  return turns
end

def won?

WIN_COMBINATIONS.each do |win_combo|
   win_index_1 = win_combo[0]
   win_index_2 = win_combo[1]
   win_index_3 = win_combo[2]

   position_1 = @board[win_index_1]
   position_2 = @board[win_index_2]
   position_3 = @board[win_index_3]

   if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
   end
 end
  return false
end

def full?
  @board.each do |i|
    if i == "" || i == " "
      return false
    end
  end
  return true
end

def draw?
  if full? == true && won? == false
    return true
  else
    return false
  end
end

def over?
  if draw? == true
    return true
  elsif won? != false
    return true
  elsif full? == true
    return true
  elsif won? == true && full? == false
    return true
  else
    return false
  end
end

def winner
  if won? == false
    return nil
  else
    winning_array = won?
    index = winning_array[0]
    if @board[winning_array[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play

until over? == true
  turn
end

if draw? == true
  puts "Cat's Game!"
elsif winner == "X"
  puts "Congratulations X!"
elsif winner == "O"
  puts "Congratulations O!"
else
  puts "Thanks for playing"
end

end


WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]


end
