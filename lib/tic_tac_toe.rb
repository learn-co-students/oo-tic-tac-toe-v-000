class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Column 1
  [1, 4, 7], #Column 2
  [2, 5, 8], #Column 3
  [0, 4, 8], #Diagonal 1
  [2, 4, 6]  #Diagonal 2
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(user_input, token = "X")
  index = user_input.to_i - 1
  @board[index] = token
end

def position_taken?(index)
  @board[index.to_i] != " " && @board[index.to_i] != ""
end

def valid_move?(user_input)
  !position_taken?(user_input.to_i - 1) && user_input.to_i.between?(1, 9)
end

def turn
  puts "Pick a number 1-9:"
  user_input = gets.strip

  if valid_move?(user_input)
    token = current_player
    move(user_input, token)
    display_board
  else
    turn
  end
end


def turn_count
  count = 0
  @board.each do |turns|
    if turns == "X" || turns == "O"
      count += 1
    end
  end
  return count
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    (@board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]) && @board[combo[0]] != " "
  end
end

def full?
 !@board.include?(" " || "")
end

def draw?
  full? && !won?
end

def over?
  draw? || won?
end

def winner
  if won?
    if @board[won?[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end

def play
  until over? || draw? || won?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end

end
