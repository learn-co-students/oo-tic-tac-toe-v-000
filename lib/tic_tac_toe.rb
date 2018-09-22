class TicTacToe
  def initialize(board = nil)
	    @board = board || Array.new(9, " ")
	  end
def display_board
  puts " #{ @board[0] } | #{ @board[1] } | #{ @board[2] } "
  puts "-----------"
  puts " #{ @board[3] } | #{ @board[4] } | #{ @board[5] } "
  puts "-----------"
  puts " #{ @board[6] } | #{ @board[7] } | #{ @board[8] } "
end

def input_to_index(user_input)
  return user_input.to_i - 1
end

def move(index, value)
  @board[index] = value
end

def valid_move?(index)
 position_taken?(index) == false && index.between?(0,8)
 end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
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
    @board.each do |cell|
      if cell != " " && cell != ""
       counter +=1
     end
  end
  counter
end

def current_player
 if turn_count.to_i.even?
  return "X"
 else return "O"
end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?
 WIN_COMBINATIONS.each do |combo|
  win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]

  position_1 = @board[win_index_1] # load the value of the board at win_index_1
  position_2 = @board[win_index_2] # load the value of the board at win_index_2
  position_3 = @board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return combo  # return the win_combination indexes that won.
  else
    false
    end
 end
 false
end

def full?
  @board.all? do |position_taken|
    position_taken == "X" || position_taken == "O"
end
end

def draw?
 if full? == true && won? == false
   return true
 else
   false
 end
end

def over?
if won?  || full?  || draw?
  return true
end
end

def winner
winning_array = won?
  if winning_array
  @board[winning_array[0]]
 else
  nil
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
