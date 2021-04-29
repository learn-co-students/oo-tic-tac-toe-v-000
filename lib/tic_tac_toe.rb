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
  [0,4,8],
  [2,4,6],
]

def display_board#(board = nil)
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def input_to_index(user_input)
  input = user_input .to_i - 1
end

def move (index, token)
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
  input = gets.strip
  index = input_to_index(input)
  # token = "X" || "O"
  token = current_player
  if valid_move?(index)
    move(index, token)
    display_board
  else
    # binding.pry
    puts "oops! that's not a valid move."
    turn
  end
end

def turn_count
  tokens = ["X", "O"]
  counter = 0
    @board.each do |turn|
      tokens.each do |token|
      if turn == token
        counter += 1
      end
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
     "X"
  else
     "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    # binding.pry
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
    end
  end
else
  return false
end

def full?
  @board.all? do |positions|
  if  positions == "X" || positions == "O"
     true
  else
     false
  end
  end
end

def draw?
  if won? == false && full? == true
    true
  end
end

def over?
  full? == true || won? || draw? == true
end

def winner
combo = won?
 if combo
   @board[combo[0]]
 end
end

def play
  until over?
    # binding.pry
    turn

  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end

end
