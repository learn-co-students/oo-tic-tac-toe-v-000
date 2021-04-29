class TicTacToe
 def initialize
   @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [0,4,8]]

def display_board
puts  " #{@board[0]} "+"|" +" #{@board[1]} "+"|"+ " #{@board[2]} "
puts "-----------"
puts  " #{@board[3]} "+"|" +" #{@board[4]} "+"|"+ " #{@board[5]} "
puts "-----------"
puts  " #{@board[6]} "+"|" +" #{@board[7]} "+"|"+ " #{@board[8]} "
end


def input_to_index(place)
  place.to_i-1
end

def move(index, value)
@board[index]=value
end

def position_taken?(index)
 if @board[index] == " " || @board[index] == "" || @board[index] == nil
   false
 else
   true
 end
end

def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)==true
    true
  end
end

def turn_count
  turns = 0
  @board.each do |mark|
    if mark == "X" || mark == "O"
    turns += 1
    end
  end
  turns
end

def current_player
 if turn_count % 2 ==0
   "X"
 else
   "O"
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

def won?
  WIN_COMBINATIONS.detect do |three|
    @board[three[0]] == @board[three[1]] &&
    @board[three[1]] == @board[three[2]] &&
    position_taken?(three[0])
  end
end

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if winning_combo = won?
    @board[winning_combo[2]]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end

end
