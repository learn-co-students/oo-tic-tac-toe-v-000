class TicTacToe
  def initialize(board = nil )
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

def move(position, character = "X")
  position = position.to_i - 1
   @board[position] = character

end
def position_taken?(position)
  @board == position
  if @board[position]== " " 
     return false
   elsif @board[position]== ""
    return false
  elsif @board[position] == nil
    return false
   else 
    return true 
  end
end
def valid_move?(position)
  position = position.to_i - 1 
  
  if position.between?(0, 8) == false 
   return false
  elsif position_taken?(position)
   return false
  else 
    return true
  end 
end
def turn
  
  puts "Please enter 1-9:"
  position = gets.strip
    if valid_move?(position) 
       move(position, current_player)
    else 
      turn
      
  end
  display_board
end
def turn_count
@board.select {|position| position != " "}.count
end
def current_player
  turn_count % 2 == 0
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end
def won?
  
  WIN_COMBINATIONS.detect do |win_combination|
   position_taken?(win_combination[0]) && @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]]

    end

end
def full?
  @board.each do |array|
    if array == " "
      return false
    else 
      true
    
    end
    end
  end
  def draw?
  if full? && !won?
    true
  else
    false
  end
end
def over?
  if full? || won? || draw?
    true
  else
    false
  end
end
def winner
  if won?
  WIN_COMBINATIONS.each do |win_combination|

if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
  return "X"
 elsif
  @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
  return "O"
    else
      nil
    
    end
  end
  end
  end
  def play
  
  until over?
   turn
  end
  if winner == "X"
    puts "Congratulations X!"
 elsif winner == "O"
    puts "Congratulations O!"
  else
    puts "Cats Game!"
  end
end

end

