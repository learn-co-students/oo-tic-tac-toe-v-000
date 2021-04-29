board = Array.new(9, " ")

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    display_board
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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


def input_to_index (input)
  @user_input = input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  @user_input = gets.strip
  index = input_to_index(@user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

#def turn_count(board)
#  counter = 0
#  board.each do |space|
#    if "#{space}" == "X" || "#{space}" == "O"
#      counter += 1
#    end
#  end
#  return counter
#end

#def current_player(board)
#  if turn_count(board).even?
#    return "X"
#  else
#    return "O"
#  end
#end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
end
end

def full?
 @board.all?{|i| i == "X" || i == "O"}
end

def draw?
  if won? != nil || full? == false
    return false
  else
    return true
  end
end

def over?
  if won? != nil || draw? == true || full? == true
    return true
  else
    return false
  end
end

def winner
 WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O"
  else
    false
  end
end
end


def play
  until won? || over?
    turn
  end
  if won? != nil
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end
  elsif draw? == true
    puts "Cat's Game!"
  end
end
end
