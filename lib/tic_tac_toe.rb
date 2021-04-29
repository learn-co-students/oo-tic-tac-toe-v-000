
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

def move (location,icon = "X")
  point = location.to_i - 1
  return @board[point] = icon
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(index)
  spot = index.to_i
  if spot.between?(1,9) and !position_taken?(spot - 1) then
    return true
  else
    return false
  end
end
def turn
  puts "Please enter 1-9:"
  spot = gets.chomp
  if valid_move?(spot) then
    move(spot,current_player)
    display_board
  else
    puts "Invalid move, try again"
    turn
  end
end
def turn_count
  counter = 0
  @board.each do |player|
    if player == "X" or player == "O" then
      counter += 1
    end
  end
    return counter
 end

def current_player
  if turn_count.even? then
    return "X"
  else
    return "O"
  end
 end

def won?
  WIN_COMBINATIONS.detect do |win|
    @board[win[0]] == @board[win[1]] && @board[win[1]] ==  @board[win[2]] && position_taken?(win[0])
  end
end

def full?
 @board.all? do |number|
   number == "X" || number == "O"
  end
end

def draw?
  !won? && full?
end

def over?
  won? || full?
end

def winner
   if won?
    @board[won?[0]]
  end
end



def play
 until over? || draw? do
    turn
 end
 if won?
   puts "Congratulations #{winner}!"
 elsif draw?
   puts "Cats Game!"
 end
end
end