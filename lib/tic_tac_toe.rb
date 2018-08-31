class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

WIN_COMBINATIONS = [
    [0,1,2],    
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    ]

def display_board
  @display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  @input_to_index
  user_input.to_i - 1
end

def move(index, current_player="X")
  @board[index] = current_player
end

def position_taken?(index)
    @board[index] != " "
  end

def valid_move?(index)
  @valid_move
 if index.between?(0,8) && !position_taken?(index)
   return true
 else 
   return false 
end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = @input_to_index
  if @valid_move
    move(index, current_player="X")
    @display_board
  else
    until over?(board)
    turn
  end
end

def turn_count
  occupied_positions = 0
  @board.each do |position|
    if position == "X" || position == "O"
  occupied_positions += 1
end
end
occupied_positions
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
end 
end
  false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
if full?(board) == true && won?(board) == false
  return true
elsif full?(board) == false && won?(board) == false
  return false
else
  if full?(board) == false && won?(board) == true
  return true
  end 
end
end
  
def over?(board) 
  if won?(board) == true && full?(board) == false 
    return true 
  elsif
    draw?(board) == true || full?(board) == true || won?(board) == true 
    return true
  else
    if won?(board) == false && full?(board) == false
    return false
end  
return true
end
end

def winner(board)
WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return "X"
    else
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
end
end
end
return nil
end

def play
  until over?(@board) do
  turn(@board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else 
    if draw?(board)
    puts "Cat's Game!"
  end 
end
end

end
end