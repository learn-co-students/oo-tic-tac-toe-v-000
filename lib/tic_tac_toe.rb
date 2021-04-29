class TicTacToe
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
  def initialize
    board = Array.new(9, " ")
    @board = board
    end

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

def move(index, token = "X")
@board[index] = token
  end

def position_taken?(index)
@board[index] == "X" || @board[index] == "O"
  end


def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
  end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
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
  if turn_count.even?
    "X"
  else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.find do |win_combination|
    windex_1 = win_combination[0]
    windex_2 = win_combination[1]
    windex_3 = win_combination[2]
    @board[windex_1] == @board[windex_2] && @board[windex_2] == @board[windex_3] && position_taken?(windex_3)
  end
end

def full?
  @board.all?{|i| i == "X"  || i == "O"}
end

def draw?
  full? && !won?
end

def over?
  draw? || won?
end

def winner
  if won?
  @board[won?[0]]
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
