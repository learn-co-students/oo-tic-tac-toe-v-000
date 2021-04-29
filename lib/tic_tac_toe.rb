class TicTacToe
  
  def initialize(board = nil)
  @board = Array.new(9," ")   
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[1,4,7],[0,3,6],[2,5,8]
  ]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end 

def input_to_index(index)
  converted_index = index.to_i 
  converted_index -= 1 
end

def move(converted_index, char = "X")
  @board[converted_index] = char
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?( index)
  if position_taken?(index)
    return false
  else
    if index <= 8 && index >= 0 
      return true 
    else
      return false
    end
  end
end 

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  converted_index = input_to_index(input)
  if valid_move?(converted_index) == true
    move(converted_index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0 
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1 
    end
  end
  return counter
end

def current_player
  if turn_count % 2 == 0 
    player = "X"
  else
    player = "O"
  end
  return player 
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    
    if position_taken?(win_index_1) == true && position_1 == position_2 && position_2 == position_3
      return win_combination
    end 
  end 
  return false 
end

def full? 
  @board.all? do |value|
    value == "X" || value == "O"
    end 
end

def draw?
  if full? == true && won? == false 
    return true 
  else
    return false 
  end 
end

def over?
  if draw? == true || full? == true || won? == true || (won? && full? == false)
    return true 
  else 
    return false 
  end 
end 

def winner
  if winning_combo = won? 
    
    @board[won?[0]]
  end 
end

def play
  while over? == false do 
    turn
    
    
  end 
  if winner == "X" 
    puts "Congratulations X!"
    elsif winner == "O"
    puts "Congratulations O!"
    elsif draw? == true 
    puts "Cat's Game!"
  end
end
end