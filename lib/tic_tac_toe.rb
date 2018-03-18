class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  # prints arbitrary arrangements of the board

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# defines a constant WIN_COMBINATIONS with arrays for each possible win combination

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

#converts user input to an integer
#subtracts 1 from the user input
#returns -1 for strings without integers
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

# sets the location the player chooses to their token, either X or O

def move(index, player)
  @board[index] = player
end

# returns true/false based on whether the position given is taken yet

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# checks the user input to ensure it is a proper location on the board

def valid_move? (index)
  if index < 9 && index >= 0 && (position_taken?(index) == FALSE)
    TRUE
  else
    FALSE
  end
end

# prompts player to enter their chosen location


def turn
  puts "Please enter 1-9:"
  num = gets.strip
  index = input_to_index(num)
  if valid_move?(index) == true
    player = current_player
    move(index, player)
    display_board
  else
    turn
  end
end

# counts occupied locations

def turn_count
  @board.count{|spot| spot != " " && spot != "" && spot != nil}
end

# returns the token of the current player (X or O)

def current_player
    if turn_count % 2 == 0 
      "X"
    else 
      "O"
    end
end

# returns false for a draw or a game that isn't finished. returns true for a win

def won?
  WIN_COMBINATIONS.each do |spot|
    win_spot1 = spot[0]
    win_spot2 = spot[1]
    win_spot3 = spot[2]
    
    if @board[win_spot1] == @board[win_spot2] && @board[win_spot1] == @board[win_spot3] && @board[win_spot1] != " "
      return spot
    end
  end
  false
end

# returns true for a draw, returns false for a game that isn't finished

def full?
  @board.all? do |played|
    played == "X" || played == "O"
  end
end

# returns true if the board is full and no one has won

def draw?
  if !won? && full?
    true
  else
    false
  end
end

# returns true for a draw, or win

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

# returns the token of the winning player

def winner
  if won? != false
    (@board[won?[0]])
  else 
    nil
  end
end

# repeats turn until the game is over


def play
    until over? == true
      turn
    end

    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
end

end