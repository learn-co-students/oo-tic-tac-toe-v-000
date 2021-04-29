class TicTacToe
  def initialize(board = Array.new(9," "))
    @board = board
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]


# Define display_board that accepts a board and prints
# out the current state.
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip

  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end  

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
empty_check = @board.all? { |x|
  x == " " }
draw_check = @board.none? { |x|
  x == " " }
win_check = WIN_COMBINATIONS.each { |win_combination|
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
}
  if empty_check == true
    return false
  elsif draw_check == true && win_check == false
    return false
  else 
    return false
end 
end

def full?
  if @board.any? { |x| x == " " } == false
    return true
  end
end

def draw?
  return (!won? && full?)
end

def over?
  draw? || won?
end

def winner
  if won? != false
    if @board[won?[0]] == "X"
      return "X"
    elsif @board[won?[0]] == "O"  
      return "O"
    end  
  else
    nil
  end
end  


def play
  count = 0
  until over?
    turn
    count += 1
  end
  
  if won? != false
    puts "Congratulations " + winner + "!"
  elsif draw? == true
    puts "Cat's Game!"
  end
end


end