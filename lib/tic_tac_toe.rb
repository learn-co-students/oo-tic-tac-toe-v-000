class TicTacToe
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
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(position) 
  position.to_i - 1 #.to_i changes to an integer
end

def move(index, value="X")
 @board[index] = value 
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")

end

def valid_move?(index)
 if index.between?(0,8) && !position_taken?(index)
   return true
 else 
   return false 
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
  @board.each do |current_player|
    if current_player == "X" || current_player == "O"
      counter += 1 
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
  "X"
else turn_count % 2 == 1 
  "O"
end
end


def won?
  
  WIN_COMBINATIONS.find do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board[win_index_1] 
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    else
      false
    end
  end
  false
end


def full?
  @board.none? do |array|
    array == " " || array == ""
  end
end


def draw?
  full? && !won?
end


def over?
 won? || draw?
end
  
def winner
 winning_combo = won?
 if winning_combo 
  @board[winning_combo[0]]
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
  end
end
  
end
  
  
  
  