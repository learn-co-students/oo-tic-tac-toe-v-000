class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
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

def move(index, input)
  @board[index] = input
end

def position_taken?(index)
 if (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
  false
else
  true
  end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
   puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
end

def turn_count
  counter = 0
  @board.each do |mark|
    if mark == "X" || mark == "O"
    counter += 1
  end
end
  return counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win|
    if @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O" ||
      @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
      return win
  end
end
false
end

def full?
  if @board.all? { |fill| fill == "X" || fill == "O" }
    return true
  end
  false
end

def draw?
  if full? && won? == false
    return true
  end
  false
end

def over?
  if full?
    return true
  elsif won? || draw?
    return true
  end
  false
end

def winner
  winner = won?
   if winner
     @board[winner[0]]
   else
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
    puts "Cat's Game!"
  end
 end

end
