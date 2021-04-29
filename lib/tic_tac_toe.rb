class TicTacToe
  def initialize(board=nil)
    @board=board || Array.new(9, " ")
  end
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
def move(location, current_player = "X" )
   @board[location.to_i-1] = current_player
end
  def position_taken?(position)
  if (@board[position] ==  " " || @board[position] == "" || @board[position] == nil)
   return false
    else
   return true
  end
end
  def valid_move?(position)
   position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

def turn
 puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input,current_player)

  else
    turn
  end
  display_board
end


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
def won?
  WIN_COMBINATIONS.detect do|win_combination|
    position_taken?(win_combination[0]) && @board[win_combination[1]] == @board[win_combination[0]] && @board[win_combination[1]] == @board[win_combination[2]]
 end
end

def full?
  @board.all? do|i|
    i == "X" || i== "O"
end
end

def draw?
  !won? && full?
end

def over?
  won? || full? || draw?
end


def winner
  winning_array=won?

    if !won?.nil?
      return @board[winning_array[0]]
    else
      nil
    end
end

def play
  while !over?    #if game is not over
    turn       #take a turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cats Game!"

    end
  end

end



