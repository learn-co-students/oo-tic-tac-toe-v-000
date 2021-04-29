class TicTacToe

def initialize
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
  [6,4,2]
]

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(0,8) && !position_taken?(position.to_i)
end

def turn_count
  counter = 0
  @board.each do |spot|
    if spot == "" || spot == " "
    counter += 0
    else
      counter += 1
    end
  end
 counter
end

def current_player
  if turn_count.even?
    current_player = "X"
  else
    current_player = "O"
  end
  current_player
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board[win_combination[0]] == "X" &&
      @board[win_combination[1]] == "X" &&
      @board[win_combination[2]] == "X" ||
      @board[win_combination[0]] == "O" &&
      @board[win_combination[1]] == "O" &&
      @board[win_combination[2]] == "O"
    end
end

def full?
  @board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?
  if !won? && full?
    return true
  end
end

def over?
  if won? || full? || draw?
    return true
  end
end

def winner
  winner = won?
  if won? != nil
    return @board[winner[0]]
  end
end

def play
  while !won? && !over? do
    turn
    won?
    draw?
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
