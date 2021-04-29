class TicTacToe
  def initialize
  @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Diagonal Top Left
  [2,4,6]  # Diagonal Top Right
]
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def input_to_index(user_input)
  user_input = user_input.to_i
  user_input = user_input - 1
end
def move(index,token)
  @board[index] = token
end
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end
def valid_move?(index)
  if index.between?(0,8) && !(position_taken?(index))
    true
  else
    false
  end
end
def turn_count
  turns = 0
  @board.each do |position|
    if position == 'X'
    turns += 1
    elsif position == 'O'
    turns += 1
    end
  end
  return turns
end
def current_player
  if turn_count.even?
    'X'
  else
    'O'
  end
end
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    token = current_player
    move(index, token)
    display_board
  else
    turn
  end
end
def won?
  WIN_COMBINATIONS.any? {|combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
          return combo
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
}
end

def full?
  @board.all? do |elements|
    elements == "O" || elements == 'X'
  end
end

def draw?
  if !won? && full?
    TRUE
  else
    FALSE
  end
end

def over?
  if won? || draw? || full?
    TRUE
  else
    FALSE
  end
end

def winner
  if won?
  position = won?[0]
  winner = @board[position]
  else
  nil
  end
  return winner
end

def play
  until over?
    turn
  end
  if won?
  puts "Congratulations #{winner}!"
  else
  puts "Cat's Game!"
  end
end


end
