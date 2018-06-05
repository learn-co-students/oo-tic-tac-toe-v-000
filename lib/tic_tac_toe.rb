class TicTacToe
  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " "," ", " "]
  end
    WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [2,4,6],  # Diagonal 
  [0,4,8],  # Diagonal
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(number)
 number.to_i - 1
end

def move(index,value)
  @board[index] = value
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  number = gets.strip
  index = input_to_index(number)
  if valid_move?(index)
   move(index, current_player)
   display_board
  else 
    turn
  end
end

def turn_count
  counter = 0
  @board.each do|space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count.even?
    "X"
  else 
    "O"
  end
end

def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
      return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      return combo
      end
    end
      false
end 

def full?
 if @board.include?(" ")
  false
  else 
   true
  end
end  

def draw?
  full? && !won? 
end

def over?
  won? || draw?
end

def winner
  combo = won?
  if combo
    @board[combo[0]]
  end
end  

def play
  until over?
    turn
  end
  if won?
      puts "Congratulations #{winner}!" 
  elsif draw?
       puts "Cat's Game!" 
  end
end
end