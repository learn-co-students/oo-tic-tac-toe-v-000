class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9," ")
end 

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(input)
  (input.to_i) - 1
end

def move(index, char)
  @board[index] = char
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    true
  elsif @board[index] != " " && @board[index] != "" && @board[index] != nil
    true
  else
    false
  end
end

def valid_move?(index)
  if index.between?(0,8) && position_taken?(index) != true
    true
 else
  false
 end
end

def turn
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(index)
    move(index, char = current_player)
      display_board
  else turn
  end
end

def turn_count
counter = 0
  @board.count do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
counter
end

def current_player
turn_count
  if turn_count.even? == true
    return "X"
  else return "O"
  end
end

def won?
WIN_COMBINATIONS.find do |i|
  @board[i[0]] == "X" && @board[i[1]] == "X" && @board[i[2]] == "X" || @board[i[0]] == "O" && @board[i[1]] == "O" && @board[i[2]] == "O"
  end
end

def full?
  @board.none?{|i| i == " "}
end

def draw?
!won? && full?
end

def won?
WIN_COMBINATIONS.find do |i|
  @board[i[0]] == "X" && @board[i[1]] == "X" && @board[i[2]] == "X" || @board[i[0]] == "O" && @board[i[1]] == "O" && @board[i[2]] == "O"
  end
end

def full?
  @board.none?{|i| i == " "}
end

def draw?
!won? && full?
end

def over?
  if won? != nil || draw? == true || full? == true
    return true
  end
end

def winner
  if index = won?
    @board[index[0]]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end