class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #first column
    [1,4,7], #second column
    [2,5,8], #third column
    [0,4,8], #back-slash
    [2,4,6] #forward-slash
  ]

  def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#converts user_input to an integer
def input_to_index(user_input)
  return user_input.to_i - 1
end

#Your #move method must take in three arguments: 1) the board array, 2) the index in the board array that the player would like to fill out with an "X" or and "O", and 3) the player's character (either "X" or "O"). We previously had you write this method with a default argument of "X" for the third argument, but that is no longer needed.
def move(index, token)
  @board[index] = token
end

# The #position_taken? method will be responsible for evaluating the position selected by the user against the Tic Tac Toe board and checking to see whether or not that index on the board array is occupied. If the user would like to fill out position 1, our #position_taken? method will check to see if that board index is vacant or if it contains an "X" or an "O". If the position is free, the method should return false (i.e. "not taken"), otherwise it will return true.

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# Build a method valid_move? that accepts a board and an index to check and returns true if the move is valid and false or nil if not. A valid move means that the submitted position is: Present or Not already filled
def valid_move?(index)
  if !index.between?(0,8) || position_taken?(index)
    #index.between?(0,8)
    #((0..8) === index)
    false
  else
    true
  end
end

#define the turn method.
def turn()
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(index)
    move(index, current_player())
    display_board()
  else
    #binding.pry
    puts "That was an invalid entry."
    turn()
  end
end

#turncount - This method takes in an argument of the board array and returns the number of turns that have been played.
def turn_count()
  i = 0
  @board.each do |position|
    if position == "X" || position == "O"
      i += 1
    end
  end
  return i
end

#The #current_player method should take in an argument of the game board and use the #turn_count method to determine if it is "X"'s turn or "O"'s.
def current_player()
  if turn_count() % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?()
  #iterate though the constant, WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |win_combo|
    #Define index position on 'board' to be tested;
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]

    # assign win_combo indices
    pos_1 = @board[index_1]
    pos_2 = @board[index_2]
    pos_3 = @board[index_3]

    # test to see if win_combo is on the 'board'
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") ||
      (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      # return the win_combo array if true and break out of the loop and method
      return win_combo
    end
  end
  # if there are no win_combinations, then return false and break out of the method
  return false
end

def full?()
  #The #full? method should accept a board and return true if every element in the board contains either an "X" or an "O".
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?()
  #accepts a board and returns true if the board has not been won and is full
  # and false if the board is not won and the board is not full, and false if the board is won.
  # You should be able to compose this method solely using the methods you used above with some ruby logic.
  if !won?() && full?()
    return true
  end
end

def over?()
  #Build a method #over? that accepts a board and returns true if the board has been won, is a draw, or is full. You should be able to compose this method solely using the methods you used above with some ruby logic.

  if won?() || draw?() || full?()
    return true
  else
    false
  end
end

def winner()
  #The #winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board.
  #The #winner method can be greatly simplified by using the methods and their return values you defined above.
  if won?()
    return @board[won?()[0]]
  else
    nil
  end
end

def play()
  until over?()
    turn()
  end

  if won?()
    puts "Congratulations #{winner()}!"
  elsif draw?()
    puts "Cat's Game!"
  end
end

end
