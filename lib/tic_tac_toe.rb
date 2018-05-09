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
    [2,4,6]]
    
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


def move(index, token)
  @board[index] = token
end


def position_taken? (index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end


def valid_move? (index)
  index.between?(0,8) && !(position_taken?(index))
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
  @board.each do |space|
   if space != " "
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
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end


def full?
  @board.all? do |token|
    token == "X" || token == "O"
  end
end


def draw?
  if !won? && full?
     return true
  end
end

  
def over?
  if won? || full? || draw?
    return true
  end
end


def winner
  if winner = won?
    return @board[winner[0]]
end
end    


def play
  until over?
  turn
  end
  
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  else
  end

end
  
end