class TicTacToe
def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

  def move(position,character = "X")
  @board[position.to_i - 1] = character
end

  def position_taken?(location)
  !(@board[location].nil? || @board[location] == " " || @board[location] == "")
end

  def valid_move?(position)
   if position.to_i.between?(1,9)
     if !position_taken?(position.to_i-1)
       true
     end
   end

  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
    if valid_move?(input) && !draw?
       move(input,current_player)
    else
      turn
    end
    display_board
end

  def turn_count
   @board.count do |token|
     token == "X" || token == "O"
   end
  count = 0
  @board.each do |token|
    if token == "X" || token == "O"
      count += 1
    end
  end
  count
end

def current_player
  if turn_count % 2 == 0
     "X"
    else
     "O"
  end
end

  def won?
WIN_COMBINATIONS.detect do |winning_combination|
    @board[winning_combination[0]] == @board[winning_combination[1]] &&
   @board[winning_combination[1]] == @board[winning_combination[2]] &&
    position_taken?(winning_combination[0])
  end
end

  def full?
 @board.all? do |full_slot|
    full_slot == "X" || full_slot == "O"
  end
end

  def draw?
  full? && !won?
end
def over?
  won? || full? || draw?
end

def winner
  if winning_combo = won?
   @board[winning_combo.first]
  end
end

def play
  until over?
     turn
  end

  if draw?
    puts "Cats Game!"

  elsif won?
    puts "Congratulations #{winner}!"

  end
end

end

