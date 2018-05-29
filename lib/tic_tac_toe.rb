class TicTacToe 
  
  def initialize 
   @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
     end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left Top-down diagonal
  [6,4,2]  # Left Bottom-up diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(move)
    index = move.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

def valid_move?(index)
  if index.between?(0, 8) && !position_taken?(index)
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
     move(index, current_player)
     display_board
  else
    turn
end
end

def turn_count
 counter = 0 
  @board.each do |boardspace|
    if boardspace == "X" || boardspace == "O"
        counter += 1 
    end 
  end
  counter
end

def current_player
  if turn_count.even?
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
  
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination 
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination 
    
    else
      false
  end
end
return false
end

  def full?
    !@board.include? (" ")
  end 

  def draw?
    full? && !won?
end 

 def over?
  won? || full? || draw?
  end
   
def winner
 if winner = won? 
  @board[winner[0]]
else
  nil
end
end

  def play
   while !over?
    turn
  end
    if won?
    puts "Congratulations #{winner}!"
    elsif draw?
    puts "Cat's Game!"
  end  
  end

end

