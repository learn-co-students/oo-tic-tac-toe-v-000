class TicTacToe
  
  attr_accessor :board
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
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
      [6,4,2]
      ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    #binding.pry
    string.to_i - 1
  end
  
  def move(location, token)
  board[location] = token
 end

 def position_taken?(index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
 end
 
  def turn
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   #binding.pry
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
WIN_COMBINATIONS.any? do |win_plz|
 if board[win_plz[0]] == board[win_plz[1]] && board[win_plz[1]] == board[win_plz[2]] && position_taken?(win_plz[1])
return win_plz
 end
end
end



def full?
board.none? do |filled|
  filled == " " || filled.nil?
  end
 end

def draw?
full? && !won?
end

def over?
  won? || draw?
end

def winner
  if won?
  board[won?[0]]
 end
end

def play
until over?
  turn
  end

  if draw? == true
    puts "Cat's Game!"
 else won?
    puts "Congratulations #{winner}!"
  end
end
end