class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
[0,3,6], [1,4,7], [2,5,8],
[0,4,8], [2,4,6]]

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

def move(index, character = "X")
  @board[index] = character
  return @board[index]
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count {|xo| xo != " "}
  # turns = 0
  # @board.each do |space|
  #   if space == "X" || space == "O"
  #     turns += 1
  #   end
  # end
  # turns
end

def current_player
 turn_count.even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win_index|
    if @board[win_index[0]] == "X" && @board[win_index[1]] == "X" && @board[win_index[2]] == "X"
      return win_index
    elsif @board[win_index[0]] == "O" && @board[win_index[1]] == "O" && @board[win_index[2]] == "O"
      return win_index
    end
  end
  false
end

def full?
  @board.all? {|xo| xo != " "}
  # @board.each do |space|
  #   if space == "X" || space == "O"
  #   else
  #     return false
  #   end
  # end
  # true
end

def draw?
  !won? && full?
end

def over?
  if won?
    return true
  elsif draw?
    return true
  else
    return false
  end
end

def winner
  if won?.class == Array
    # return board[won?(board)[0]]
    won?.each do |winner|
      if @board[winner] == "X" || @board[winner] == "O"
        return @board[winner]
      end
    end
  end
end

def play
  until over? == true
    turn
  end
  if won?
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end
  elsif draw?
    puts "Cat's Game!"
  end
end

end
