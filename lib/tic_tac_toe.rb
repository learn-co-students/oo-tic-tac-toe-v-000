class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index (index)
 index = index.to_i
 index = index - 1
end
def valid_move?(index)
if index.between?(0,8) && !position_taken?(index)
return true
else
false
  end
end
def turn_count
  count = 0
  @board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
  count
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"

  input = gets.strip
  index = input_to_index(input)
  value = current_player
  if valid_move?(index)
     move(index,value)
     display_board
   else
     turn
   end
   puts "Please enter 1-9:"
 end

 def won?
   WIN_COMBINATIONS.find do |win_combo|
     @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[1])
   end
 end
 def full?
 @board.none? do |full_board|
   full_board == " " || nil
   end
 end

 def draw?
   won? == nil && full? == true
 end

 def over?
     draw? == true || won? != nil
 end

 def winner
  if won? != nil
    winner = @board[won?[0]]
  end
 end

 def play
   until over? == true
     turn
   end
   if won?
    puts "Congratulations #{winner}!"
  else draw? == true
    puts "Cat's Game!"
   end
 end


def move(index, value = "X")
  @board[index.to_i] = value
end

def position_taken?(index)
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    return false
  else #(board[index] == "X" || board[index]== "O")
    return true
  end
end
end
