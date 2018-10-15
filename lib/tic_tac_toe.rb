class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index,current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
   if @board[index] == " " || @board[index] == "" || @board[index] == nil
       false
     else @board[index] == "X" || @board[index] == "O"
       true
  end
  end

  def valid_move?(index)
   if index.between?(0,8) && !position_taken?(index)
     true
   else
     false
   end
  end

  WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def won?
      WIN_COMBINATIONS.detect do |win_combination|
  (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
  end
end


def full?
 !@board.include?(" ")
end

def draw?
  if  !won? && full?
    true
  elsif  !won?  && !full?
    false
  else won? && full?
    false
  end
end


def over?
  if won? || draw? == true || full? == true
  return true
end
end

def winner
  if !won?
    nil
else @board[won?[0]]
end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if valid_move?(index)
  move(index,current_player)
  display_board
else
  turn
end
end

def play
  until over? == true
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
      puts "Congratulations O!"
  else draw? == true
    puts "Cat's Game!"
  end
end

end
