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

def input_to_index(user_input)
    @user_input = user_input
end

def move(index, current_player)
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
  input = gets
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count

 count = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      count += 1
    end
  end
 count
end

def current_player
player = "X"
  if turn_count % 2 == 0
    player = "X"
  else
    player = "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win|
    if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X" || @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
     return win
    end
  end
return false
end

def full?
  if turn_count == 9
    true
  else
    false
  end
end

def draw?
  if !won? && full?
    true
  else
    false
  end
end

def over?
  if won? || full? || draw?
    true
  else
    false
  end
end

def winner
  if won?
    @board[won?[0]]
  end
end

def play

  if !over?
    turn
    play
  elsif over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
#
end
#
