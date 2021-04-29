class TicTacToe


def initialize
@board = [" "," "," "," "," "," "," "," "," "]
end


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
 index = input.to_i
position = index - 1
end

def move(position,symbol= "X")
@board[position] = symbol
end


def position_taken?(index)
 if @board[index] == " " || @board[index] == "" || @board[index] == nil
  return false
  else
   return true
 end
end

def valid_move?(index)
  if index.between?(0,8) && position_taken?(index)
    return false
  elsif !index.between?(0,8)
      return false
    else
        return true
end
end

def turn_count
 counter = 0
 @board.each do |symbol|
    if symbol == "O"|| symbol == "X"
     counter += 1
    end
 end
return counter
end


def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn
puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
if valid_move?(index)
  symbol=current_player
  move(index,symbol)
  display_board
else
  turn
end
end




def won?
  WIN_COMBINATIONS.each do |win_combination|

  position_1 = @board[win_combination[0]]
  position_2 = @board[win_combination[1]]
  position_3 = @board[win_combination[2]]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
   return win_combination
  end
 end
 return false
end


def full?
  @board.each do |position|
    if position == " " || position == ""
      return false
    end
  end
  @board.detect do |i|
    if i == "X" || i == "O"
      return true
    end
  end
end

def draw?
if won?
  return false
end
  @board.each do |position|
   if position == "" || position == " "
    return false
   end
  end
  if full?
    return true
end
end

def over?
if won?
  return true
end
if full?
  return true
end
end


def winner
  WIN_COMBINATIONS.each do |win_combination|

   position_1 = @board[win_combination[0]]
   position_2 = @board[win_combination[1]]
   position_3 = @board[win_combination[2]]

   if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
  end
end
WIN_COMBINATIONS.each do |win_combination|

 position_1 = @board[win_combination[0]]
 position_2 = @board[win_combination[1]]
 position_3 = @board[win_combination[2]]

 if position_1 == "O" && position_2 == "O" && position_3 == "O"
  return "O"
end
end
  return nil
end


def play
  until over?||  draw?
turn
end
if won?
  puts "Congratulations #{winner}!"
else
    puts "Cat's Game!"
end
end


end
