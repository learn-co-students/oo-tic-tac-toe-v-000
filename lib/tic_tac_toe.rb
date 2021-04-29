class TicTacToe
  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  def board 
     @board
   end
  end
  
  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def display_board
    
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} 
-----------
 #{@board[3]} | #{@board[4]} | #{@board[5]} 
-----------
 #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(position, value)

  @board[position] = value
end

def position_taken?(index)
 !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
end

def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index) 
 end

def turn_count
  @board.count { |x| x !=" "}
end

def current_player
  if 
    turn_count % 2 == 0
"X"
else
  "O"
  end
end

def turn
  puts "Please enter 1-9:"
 user_input = gets.strip
 position = input_to_index(user_input)
 value = current_player
 if valid_move?(position) == true
   move(position, value)
 display_board
 else 
   turn
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
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
  nil
end

def full?
    !@board.any? {|x|
      x == " "}
  end
  
  def draw?
    if
      won?
    else
      full?
  end
end

def over?
  won? || draw? || full?
end

def winner
  if index = won?
  @board[index[0]]
end
end

def play
  while !over?
turn
end
if winner == "X"
  puts "Congratulations X!"
  elsif winner == "O"
  puts "Congratulations O!"
else 
  puts "Cat's Game!"
  
end
end

end