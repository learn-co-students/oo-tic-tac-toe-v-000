
class TicTacToe
  def initialize
   @board = Array.new(9, " ")
 end
######################################
 WIN_COMBINATIONS = [
   [0, 1, 2], #top row
   [3, 4, 5], #horizontal middle row
   [6, 7, 8], #bottom row
   [0, 3, 6], #left column
   [1, 4, 7], #middle column
   [2, 5, 8], #right column
   [0, 4, 8], #left diagonal
   [2, 4, 6]  #right diagonal
   ]
######################################
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
######################################
  def input_to_index(inp)
  inp.to_i-1
  end
######################################
  def move (inp,ch)
    @board[inp]=ch
  end
######################################
 def position_taken?(i)
   @board[i]=="X"||@board[i]=="O"
 end
######################################
def valid_move?(i)
  (0..8)===i && !(position_taken?(i))
end
######################################
def turn_count
  @board.count("X")+ @board.count("O")
end
######################################
def current_player
   turn_count.even? ? "X":"O"
 end
######################################
def turn

  puts "Please choose btwn 1-9"
  inp=input_to_index(gets.strip)
  !(valid_move?(inp)) ? turn : move(inp,current_player)
  display_board
end
######################################
def won?
  WIN_COMBINATIONS.detect do |idx|
    if idx.all? {|i| @board[i] == "X" } == true
      idx
    elsif idx.all? {|i| @board[i] == "O" } == true
      idx
    end
  end
end
######################################
def full?
@board.all? {|i| i == "X" || i == "O" }
end
######################################
def draw?
won? == nil && full?
end
######################################
def over?
draw?||won?
end
######################################
def winner
@board[won?[0]] if  won?
end
######################################
def play

until over?
    turn
  end
draw? ? (puts "Cat's Game!") :  (puts "Congratulations #{winner}!" )
end
######################################

end
