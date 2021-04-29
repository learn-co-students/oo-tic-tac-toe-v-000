class TicTacToe

  def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
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

def input_to_index(user_input)
  user_input.to_i - 1
end

def turn_count
  turns = 0
  @board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end

def current_player
  turns = turn_count
  if turns % 2 == 0
    "X"
  else
    "O"
  end
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn

  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  validity = false
  while validity == false
    if valid_move?(index) == true
      validity = true
    else
      puts "Please enter 1-9:"
      input = gets.chomp
      index = input_to_index(input)
    end
  end
  move(index, current_player)
  display_board


end

def play
  until over? || draw? do
    turn
  end
  if draw?
    puts "Cat's Game!"
  else
    xo = winner
    puts "Congratulations #{xo}!"
  end
end

def won?
  results = nil
  WIN_COMBINATIONS.each do |winner|
    if winner.all?{|tester| @board[tester] == "X"}
      results = winner
    elsif winner.all?{|tester| @board[tester] == "O"}
      results = winner
    end
  end
  return results
end

def full?
  @board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?
  !won? && full?
end

def over?
  won? || full?
end

def winner
  winning_board = won?
  if winning_board == nil
    return nil
  else
    return @board[winning_board[0]]
  end
end

end
