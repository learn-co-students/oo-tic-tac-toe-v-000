class TicTacToe

def initialize
  @board = Array.new(9, " ")
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
  [6,4,2]
]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player = "X")
  @board[index.to_i-1] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(user_input)
  index =  input_to_index(user_input)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  count = 0
  @board.each do |position|
    if position != " "
      count += 1
    else
    end
  end
  count
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      return combination
    end
  end
  return false
end

def full?
  @board.none? {|position| position == " "} || false
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if won?
    @board[won?[0]]
  elsif draw?
    nil
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
