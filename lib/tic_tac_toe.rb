class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,4,6],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, token)
 @board[index] = token
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
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

def turn_count
    @board.count{|token| token == "X" || token == "O"}
end
  
def current_player
    turn_count % 2 == 0 ? "X" : "O"
end

def won?
    WIN_COMBINATIONS.any? do |com|
      if position_taken?(com[0]) && @board[com[0]] == @board[com[1]] && @board[com[1]] == @board[com[2]]
        return com
      end
    end
end

def full?
    @board.all?{|token| token != " " }
  end

def draw?
!won? && full?
  end
  
def over?
  won? || draw?
end

def winner
  if com = won? 
  @board[com[0]]
end
end

def play
 until over?
  turn
 end
  if com = won?
   puts "Congratulations #{winner}!"
  else
   puts "Cat's Game!"
end
end
end