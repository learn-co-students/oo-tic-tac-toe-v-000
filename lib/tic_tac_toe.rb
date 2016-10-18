class TicTacToe
  def initialize(board=nil)
    @board= board || Array.new(9, " ")
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

  def move(input, token="X")
    @board[input.to_i-1]=token
end

def position_taken?(input)
  !(@board[input].nil? || @board[input]== " ")
end

def valid_move?(input)
input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
end

def turn
  puts "Please enter a number from 1-9"
  input = gets.chomp
  if !valid_move?(input)
  turn
else
  move(input, current_player)
  display_board
end
end

def turn_count
  turns = 0
  @board.each do |index|
    if index == "X" || index == "O"
    turns +=1
  end
end
turns
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

def full?
  @board.all? {|place| place == "X" || place == "O"}
end

def draw?
  !won? && full?
end

def over?
  @board.all? {|x| won? || full? || draw?}
end

def winner
if winning_combo = won?
    @board[winning_combo.first]
end
end

def play
  while !over?
      turn
    end
if won?
puts "Congratulations #{winner}!"
elsif draw?
    puts "Cats Game!"
  end
end


end
