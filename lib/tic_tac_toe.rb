class TicTacToe
#  def initialize(board = nil)
#    @board = board
#
# end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def initialize(board = nil)
  if board == nil
    @board = Array.new(9," ")
  else
    @board = board
  end
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
   index = user_input.to_i - 1
end

def move(index,value)
  @board[index] = value
  # puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  # puts "-----------"
  # puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  # puts "-----------"
  # puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  display_board
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end



def turn_count
  counter = 0
  @board.each { |token|
    if token == "O" || token == "X"
       counter += 1
    end
  }
  return counter
end


def current_player
    counter = turn_count
    if counter.odd?
      player = "O"
    else
      player = "X"
    end
    return player
end

def turn
  puts "Please enter 1-9:"
  user_input = gets
  index = input_to_index(user_input)
  if valid_move?(index)
       move(index, current_player)
  else
      turn
  end
end



def won?
  WIN_COMBINATIONS.each do |combwin|
     if @board[combwin[0]] == "X" && @board[combwin[1]] == "X" && @board[combwin[2]]  == "X"
       return combwin
     end

     if @board[combwin[0]] == "O" && @board[combwin[1]] == "O" && @board[combwin[2]]  == "O"
       return combwin
     end
  end
  return false
end

def full?
  total = @board.all? do |value|
    value == "X" || value == "O"
  end
  return total
end

def draw?
    if full? == true && won? == false
      return true
    end
end

def over?
  if won?
    return true
  elsif  draw? == true
   return true
 else
    return false
 end
end

def winner
  if won? != false
  matrix = won?
 return @board[matrix[0]]
 end
end

def play
  while !over?  #until the game is over--> take turns
     turn
  end

  if won? != false
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  else
  end
end

end#class
