class TicTacToe

def initialize(board=nil)
  @board=board || Array.new(9," ")
end

WIN_COMBINATIONS= [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index,current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
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

def turn_count
  @board.count {|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0?"X":"O"
end

def won?
WIN_COMBINATIONS.detect do |i|
  @board[i[0]] == @board[i[1]] && @board[i[0]] == @board[i[2]] && position_taken?(i[0])
   end
end

def full?
  @board.all? do |i|
   i == "X" || i == "O"
  end
end

def draw?
   full? && !won?
end

def over?
   full? || won? || draw?
end

def winner
   @board[won?[0]] if won?
end


def play
  counter=0
  until over?
    turn
    counter+=1
  end
    if winner
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
  end
end

end
