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
  [6,4,2]
]
 
 
 def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
 

def play
  until over? == true
    turn
  end
  
  if won? != nil
    won = won?
    winner
  else
    over = over?
    puts "Cat's Game!"
  end
end



def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
  else
    turn
  end
  display_board
end

def input_to_index(input)
  @index = input.to_i - 1
end


def valid_move?(index)
  if index.between?(0,8) && position_taken?(index) == false
    true
  else
    false
  end
end


def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    true
  else
    false
  end
end


def move(index, player_token="X")
  @board[index] = player_token
  @board = @board
  # over?
end


def current_player
  count = turn_count
  @current_player = ""
  if count % 2 == 0 
    @current_player = "X"
  else 
    @current_player = "O"
  end
  @current_player
end


def turn_count
  @count = 0
  @board.each do | object |
    if object == "X" || object == "O"
      @count += 1
    end
  end
  @count
end

# Helper Methods for Determining Game State

def won?
count = 0
while count <= WIN_COMBINATIONS.length-1
  win_combination = WIN_COMBINATIONS[count]

  win_index1 = win_combination[0]
  win_index2 = win_combination[1]
  win_index3 = win_combination[2]
  
  position_1 = @board[win_index1]
  position_2 = @board[win_index2]
  position_3 = @board[win_index3]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    winning_array = [win_index1,win_index2,win_index3]
  end
  count += 1
end
winning_array
end

def full?
  !@board.include?(" ") #=> true
end

def draw?
  won = won?
  full = full?
  if won == nil && full == true
    true
  elsif won != ""
    false
  end
end

def over?
  if won? != nil || draw? == true || full? == true
    true
  else
    false
  end
end

def winner
  won = won?
  if won != nil
    winnerarray = @board[won[0]]
    puts "Congratulations #{winnerarray}!"
  end
  winnerarray
end

end