class TicTacToe
  def initialize
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @board = board 
  end
   
   WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 4, 8],
   [2, 4, 6],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def move(input, token = current_player)
  index = input.to_i - 1
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil 
    return false 
  else @board[index] == "X" || @board[index] == "O" 
    return true
end
end

def valid_move?(input)
  index = input.to_i - 1
  position_taken?(index) == false && index.between?(0, 8) ? true : false 
end

def turn
   puts "Please enter 1-9:"
   input = gets.strip
   index = input.to_i - 1 
  if valid_move?(input) 
    move(input)
    display_board
  else 
  turn
  end
end

def turn_count
@board.count{|item| item == "X" || item == "O"}
end


def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |win_index|
    index_1 = win_index[0] 
    index_2 = win_index[1] 
    index_3 = win_index[2]
   if (@board[index_1] == "X" && @board[index_2] == "X" && @board[index_3] == "X") || (@board[index_1] == "O" && @board[index_2] == "O" && @board[index_3] == "O") 
   return win_index
   else false 
  end
end
end

def full?
  @board.all?{|i| i == "X" || i == "O"} 
end

def draw?
  won? || !full? ? false : true
end

def over?
  won? || draw? ? true : false 
end

def winner
  win_index = won?
  if win_index == nil
  return nil
  else @board[win_index[0]] == "X" || @board[win_index[0]] == "O"
  return @board[win_index[0]]
  end
end

def play
  until over? 
  turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end 
end
end