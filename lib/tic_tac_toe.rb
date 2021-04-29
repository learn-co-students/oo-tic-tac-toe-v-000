class TicTacToe
  def initialize(board=nil)
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
  [6, 4, 2],
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

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  counter = 0
  @board.each {|value| if value == "X" || value == "O" then counter += 1 end}
    return counter
end

def current_player
  if turn_count.even?
    return "X"
  else turn_count.odd?
    return "O"
  end
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
      win_combination.detect do |win_index|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
       @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X" || @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
      end
    end
  end

  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    if won? == nil && full? == true
      return true
    elsif won? == false && full? == false
      return false
    else won? == true
      return false
    end
  end

  def over?
     won? || full? || draw?
  end

  def winner
  if winning_index = won?
    @board[winning_index.first]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw? == true
    puts "Cat's Game!"
  end
end

end
