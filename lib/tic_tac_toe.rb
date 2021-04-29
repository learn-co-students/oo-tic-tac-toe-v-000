

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
   [0,1,2], # " #board[0] | #board[1] | #board[2] "
   [3,4,5], # horizontal win
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
   ]

   def display_board #Displays empty board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input) #change string to integer
    index = user_input.to_i - 1
  end

  def move(index, char) #actual move
    @board[index] = char #where on the board with which letter
  end

  def position_taken?(index) #may not be needed
 if @board[index] == " "
   return false
  elsif @board[index] == ""
   return false
  elsif @board[index] == nil
   return false
  else @board[index] == "X" || "O"
   return true
 end
 end

 def valid_move?(index) #checking to see if move is valid
 if position_taken?(index)
     false
  elsif index < 9 && index >= 0
     true
  end
 end

 def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
 end

 def current_player
  counter = 0
  while counter < 9
   if turn_count % 2 == 0
    return "X"
    else
    return "O"
   end
  counter += 1
  end
 end

 def turn #main funtion
  puts "Please enter 1-9:" #intro
  input = gets.strip # gets user input
  index = input_to_index(input) #converts num to an integer and subtracts 1 for array purposes
  char = current_player
  if index < 9 && index > -1 # gives a second try if user selected wrong option
   valid_move?(index) #checks if move is valid
   move(index, char) #places move on board
   display_board #displays board updated with current moves
  else turn #displays board from beginning to allow another try
  end
 end

 def won?
  WIN_COMBINATIONS.find { |w_c| @board[w_c[0]] == @board[w_c[1]] && @board[w_c[1]] == @board[w_c[2]] && @board[w_c[0]] != " " }
end

def full?
  @board.each do |spaces|
    if spaces != "X" && spaces != "O"
      return false
    else
    true
    end
  end
end

def draw?
  !won? && full?
end

def over?
  draw? || won?
end

def winner #=> ["X","X","X"]
  winner = won? #=> [6,4,2]
  if winner
    @board[winner[0]]
  end
end

def play #method to play
   #allows more than one move
   counter = 0
   while counter < 8
    if !over?
      turn
    elsif won?
      game_winner = winner
      puts "Congratulations #{game_winner}!"
      break
    elsif full?
      puts "Cat's Game!"
      break
    elsif draw?
      puts "Cat's game!"
      break

  end
  counter += 1
end
end

def over?
  draw? || won?
end

end
