
class TicTacToe
  def initialize(board = nil)
    @board = board || board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

def move(index, player_token)
  @board[index] = player_token
end



def position_taken?(index)
  if @board[index] == " " || @board[index] == ""
    false
  elsif @board[index] == nil
    false
  elsif @board[index] == "X" || @board[index] == "O"
    true
  end
end



def valid_move?(index)
  if index.to_i.between?(0,8) && !position_taken?(index.to_i) # for occupied position
    true
  else  # for empty position
    false
  end
end


def turn
  puts "Please enter 1-9:"
  index = input_to_index(gets.chomp)
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
    display_board
  else
    turn
  end
end


def turn_count
  counter = 0
  @board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  return counter
end

  
def current_player
  if turn_count.even?
    "X"
  else
    "O"
  end
end


def won?
WIN_COMBINATIONS.detect do |win_combination|

@board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])

  end
end


def full?
  @board.all? do|index|
    index == "X" || index == "O"
  end
end



 def draw?
   !won? && full?
 end



def over?
  draw? || won?
end



def winner

  if won?
    winning_index_array = won? #=> [0,1,2]
    @board[winning_index_array[0]]
  end
end



def play
  until over?
    turn
  end

    if over? && won?
      winner
      puts "Congratulations #{winner}!"
    elsif draw? && over?
      puts "Cat's Game!"
    end
  end

end 
