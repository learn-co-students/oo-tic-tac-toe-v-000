class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end

#constants
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

#Methods

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position,token="X")
  @board[position-1] = token
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] ==nil
    false
  else
    true
  end
end

def valid_move?(position)
  position=position.to_i-1
  if position.between?(0,8) && !position_taken?(position)
    true
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  position= user_input.to_i
  if valid_move?(position)
      move(position, current_player)
    else turn
  end
  display_board
end

def turn_count
  counter = 0
  @board.collect do |board|
    if board == "X" || board == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count%2 == 0
    "X"
  else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_index|
    @board[win_index[0]] == @board[win_index[1]] && @board[win_index[1]] == @board[win_index[2]] && position_taken?(win_index[0])
  end
end

def full?
  @board.all? do |board_index|
    board_index == "X" || board_index == "O"
  end
end

def draw?
  if full? && !won?
   true
  end
end

def over?
  won? || draw?
end

def winner
won?
if won? != nil
@board[won?[0]]
    end
  end

  def play

    until over?
    turn
    end

    if draw?
    puts "Cats Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end


end
