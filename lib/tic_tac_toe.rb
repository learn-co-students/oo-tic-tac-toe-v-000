class TicTacToe
  
def initialize(board = nil)
    @board = board || Array.new(9," ")
end
  
  WIN_COMBINATIONS = [
    [0,1,2], #top_row 
    [3,4,5], #middle
    [6,7,8], #bottom
    [0,3,6], #left_vertical
    [1,4,7], #middle_vertical
    [2,5,8], #right_vertical
    [0,4,8], #left_diagonal
    [2,4,6] #right_diagonal
    ]
  
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
def input_to_index(input)
    index = (input.to_i) - 1
end
  
def move(index, player_token = "X")
    @board[index] = player_token
end
  
def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return false
  else
    return true
  end
end
  
def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8) == true
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  p_input = gets.strip
  index = input_to_index(p_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end  
end

def turn_count
  count = 0 
  @board.each do |i|
    if i == "X" || i == "O"
      count += 1 
    end
  end
return count  
end
  
def current_player
  if turn_count % 2 == 0 
    return "X"
  else
    return "O"
  end
end
def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
end
else
  false
end

def full?
  @board.all? do |box|
    box == "X" || box == "O"
  end
end

def draw?
  if !won? == true && full? == true
    return true
  end
  if won? == false || full? == false
    return false
  end
  if won? == true 
    return false
  end
end

def over?
  if draw? || won?
    return true
  else
    return false
  end
end

def winner
  if win_combination = won?
   return @board[win_combination.first]
  end
end

def play
  until over? == true
    turn
  end
  
  if won? && winner == "X"
    puts "Congratulations X!"
  end
  if won? && winner == "O" 
    puts "Congratulations O!"
  end
  if draw? == true
    puts "Cat's Game!"
  end
end

end