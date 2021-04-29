class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  #First column
    [1,4,7],  #Second column
    [2,5,8],  #Third column
    [0,4,8],  #diagonal1
    [2,4,6]  #diagonal2
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

def move(index, current_player)
@board[index] = current_player
end

def position_taken?(index)
  !(@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
end

def valid_move?(index)
  (index.between?(0, 8)) && !(position_taken?(index))
end

def turn
  puts "Please enter 1-9:"
    user_input = gets.strip
  if valid_move?(index = input_to_index(user_input))
    move(index,current_player)
  else
    turn
  end
  display_board
end

def turn_count
turn = 0
@board.each do |cell|
  if (cell.include? "X") || (cell.include? "O")
turn += 1
  end
end
return turn
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combination|
    @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]] && position_taken?(combination[0])
end
end

def full?
  WIN_COMBINATIONS.all? { |combination| position_taken?(combination[0]) }
end

def draw?
  incomplete_board = !full?
  if won? && full? || incomplete_board
    return false
  else
    return true
end
end


def over?
  won? || full? || draw?
end

def winner
  if won?
    win_index = won?[0]
    return @board[win_index]
  end
end

def play
  until over?
    turn
  end
  @board.each do |index|
    over?
  end
  if won?
    puts "Congratulations " +  winner + "!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
