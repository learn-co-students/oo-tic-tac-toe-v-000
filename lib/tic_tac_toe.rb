class TicTacToe
def initialize(board = nil)
@board = Array.new(9, " ")
end
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]
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

def move(index,token)
  @board[index] = "#{token}"
end

def position_taken?(position)
  @board[position] == "X" || @board[position] == "O"
end

def valid_move?(position)
  !position_taken?(position) &&
  position.between?(0,8)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  position = input_to_index(input)

  if valid_move?(position)
    move(position,current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count{|item|item == "X" || item == "O"}
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

def full?
  @board.all?{|item|item == "X" || item == "O"}
end

def draw?
  full? && !won?
end

def over?
  draw? || won?
end

  def winner

    if won?
      if @board.count("X") > @board.count("O")
        "X"
      else
        "O"
      end
    end
  end

  def play
    until over?
      turn
    end

    if winner == "X"
      puts "Congratulations X!"

    elsif winner == "O"
      puts "Congratulations O!"

    else
      puts "Cat's Game!"
    end
  end
end
