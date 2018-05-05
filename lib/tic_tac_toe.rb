# Define your TicTacToe class
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
end

# WIN_COMBINATIONS
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal 1 
  [6,4,2]  #Diagonal 2
  
]

# display_board
def display_board
  puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts"-----------"
  puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts"-----------"
  puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "  
end

# input_to_index
def input_to_index(input)
  input.to_i - 1
end

# move
def move(index, player_token = "X")
    @board[index] = player_token
end

# position_taken?
def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
end    
    
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end    

def turn_count
  count = 0
  @board.each do |token|
    if token == "X" || token == "O"
      count += 1
  end
end
count
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

#turn
    def turn
      puts "Please enter 1-9:"
      i = gets.strip
      index = input_to_index(i)
      m = valid_move?(index)
      if m == TRUE
        move(index, current_player)
        display_board
    else
      turn
    end
end

# won?
def won?
WIN_COMBINATIONS.detect do |win_combination| 
  
  location1 = win_combination[0]
  location2 = win_combination[1]
  location3 = win_combination[2]
  @board[location1] == @board[location2] && @board[location2] == @board[location3] && @board[location1] != " "
    end
  end

# full
def full?
  @board.all? {|token| token == "X" || token == "O"}
end

# draw
def draw?
  won? == nil && full? == TRUE
end

# over
def over?
  draw? == TRUE || won? != nil
end

# winner
def winner
  if won? != nil
    winner = @board[won?[0]]
  end
end

def play
  until over? == TRUE
    turn
  end
  if draw? == TRUE
    puts "Cat's Game!"
  else won?
    puts "Congratulations #{winner}!"
    end
end
end