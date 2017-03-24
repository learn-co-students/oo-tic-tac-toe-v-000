class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [2,5,8],
    [0,3,6],
    [1,4,7]
  ]


def display_board
 puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
 puts "------------"
 puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
 puts "------------"
 puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def position_taken?(index)
 board[index] == "X" || board[index] == "O"
end
def input_to_index(input)
 return input.to_i - 1
end
def move(index, token)
  @board[index] = token
end

def turn
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(index)
     move(index, current_player)
     display_board
  else
    turn
   end
end

def turn_count
  pos = 0
  @board.each do |token|
    if token == "X" || token == "O"
     pos+=1
    end
  end
  return pos
end

def current_player
  if turn_count%2 == 0
    return "X"
  else
    return "O"
  end
end

# Helper Method
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
def won?
   WIN_COMBINATIONS.detect{|win| @board[win[0]] ==  @board[win[1]] && @board[win[1]] ==  @board[win[2]] && position_taken?(win[2])}
end
def full?
  @board.all? do |token|
    token == "O" || token == "X"
  end
end

def draw?
   !won? && full?
end

def over?
  won?|| draw?
end

def winner
  if won? != nil
    @board[won?[0]]
  end
end

def play
  until over?
    turn
  end
   if won?
     puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
