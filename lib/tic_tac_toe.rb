class TicTacToe
def initialize(board = nil)
  @board = board || Array.new(9," ")
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


WIN_COMBINATIONS = [
[0,1,2],   #Top row
[3,4,5],   #Middle row
[6,7,8],   #Bottom row
[0,3,6],   #Column 1
[1,4,7],   #Column 2
[2,5,8],   #Column 3
[0,4,8],   #Left to right diagonal down
[2,4,6]    #Left to right diagonal up
]

def input_to_index(input)
   input.to_i - 1
end

def move(index,token)
  @board[index] = token
end


def position_taken?(index)

@board[index] != " " && @board[index] != ""

end

def valid_move?(index)
if index.to_i >= 0 && index.to_i <8 && position_taken?(index) == false
  return true
end
end


def turn
  index = 0
  again = false
  while (!again)
     puts "Please enter 1-9:" #ask for input
     input = gets.strip #get input
     index = input_to_index(input) #convert input to index
     again = valid_move?(index) #if move is valid_move
   end
   move(index, current_player) #make the move for index
     display_board #show the board
end

def won?
WIN_COMBINATIONS.each do |combo|
  if combo.all?{|i| position_taken?(i)} && (combo.all?{|i| @board[i]== 'X'} || combo.all?{|i| @board[i]== 'O'})
return combo
end
end
return false
end

def full?
  @board.each do |index|
    if index != "X" && index != "O"
      return false
    end
  end
  return true
end

def draw?
  if !(won?) && full?
    return true
  else
    return false
  end
end

def over?
  if won? || draw?
    return true
  else
    return false
  end
end

def winner
  if won?
  combo = won?
  return @board[combo[0]]
end
end

def play
  until over?
    turn
  end
  if draw?
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner}!"
  end
end
end
