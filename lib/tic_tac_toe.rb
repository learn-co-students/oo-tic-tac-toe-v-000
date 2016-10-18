class TicTacToe

  attr_accessor(:board)

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]

def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(index, player)
  @board[index - 1] = player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(position)
  if position.to_i.between?(1,9) && !position_taken?(position.to_i - 1) #now 1-9 bc it's testing position, not index & we have to convert it to #
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  input = position.to_i
  if valid_move?(input)
    move(input, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
  end
end
counter
end

def current_player
  turn_count
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combination|
    @board[combination[0]] == @board[combination[1]] &&
    @board[combination[1]] == @board[combination[2]] &&
    position_taken?(combination[0])
  end
end

def full?
  @board.all? {|tile| tile == "X" || tile == "O" }
end

def draw?
  if !won? && full?
    return true
  else
  return false
  end
end

def over?
  if draw? || full? || won?
    true
  else
    false
  end
end

def winner
WIN_COMBINATIONS.each do |combination|
  if @board[combination[0]] == "X" && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
    return "X"
  end
  if @board[combination[0]] == "O" && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
    return "O"
  end
end
  nil
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
