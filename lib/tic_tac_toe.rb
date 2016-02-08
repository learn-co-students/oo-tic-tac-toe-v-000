#OO Tic Tac Toe
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
  [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, current_player = "X")
  @board[location.to_i-1] = current_player
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input) && turn_count.even?
    move(input, "X")
  elsif valid_move?(input) && turn_count.odd?
    move(input, "O")
  else
    turn
  end
  display_board
end

def turn_count
  turn_counter = 0
  @board.each do |character|
    if "#{character}" == "X"
      turn_counter = turn_counter + 1
    elsif "#{character}" == "O"
      turn_counter = turn_counter + 1
    else 
      turn_counter = turn_counter
    end
  end
  return turn_counter
end

def current_player
  turn_count
  if turn_count % 2 == 0
    "X"
  elsif turn_count % 2 == 1
    "O"
  end
end

def won?
  if won_helper? == WIN_COMBINATIONS
    false
  else
    won_helper?
  end
end

def won_helper?
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination [2]

  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
  end
end

def full?
  !@board.include?(" " || "")
end

def draw?
  !won? && full?
end

def over?
  if won? || draw?
    true
  end
end

def winner
  if won? != false
    @board[won?[0]]
  end
end

def play
  while !over?
    turn
  end
  if won? && winner == "X"
    puts "Congratulations X!" 
  elsif won? && winner == "O" 
    puts "Congratulations O!"
  elsif draw?
   puts "Cats Game!"
  end
end

end