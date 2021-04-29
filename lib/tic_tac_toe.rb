require "pry"

class TicTacToe

#Ensures that board variable is always a property of new instances of the Tic Tac Toe class

  def initialize
    @board = Array.new(9, " ")
  end
  
# WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # top row win
    [3,4,5], # middle row win
    [6,7,8], # bottom row win
    [0,3,6], # left column win
    [1,4,7], # middle column win
    [2,5,8], # right column win
    [0,4,8], # left-top-to-right-bottom diagonal win
    [2,4,6]  # left-bottom-to-right-top diagonal win  
  ]

#display_board - displays board at beginning of game

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

#Converts user input to an integer minus 1  
  def input_to_index(user_input)
    return user_input.to_i - 1
  end
  
#Places player token on board
  def move(index, player_token = "X")
    @board[index] = player_token
  end


#Checks whether or not position is already taken
  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end


#Checks that chosen position/turn is present on the game board and available
  def valid_move?(index)
    index.between?(0,9) && @board[index] == " "
  end
  
#Executes a complete turn
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    
    player_token = current_player
    
    if valid_move?(index)
      move(index, player_token)
      display_board
    else
      puts "Invalid move. Please try again."
      turn
    end
  end

#Tracks no. of turns
  def turn_count
    counter = 0
    @board.each do | player_token |
      if player_token.downcase == "x" || player_token.downcase == "o"
        counter += 1
      end
    end
    counter
  end

#Determines whether player token is X or O
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

#Looks for winning combinations
  def won?

  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3]
    
  # load the value of the board at win_index_3
   
   if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
   end
  return false
end

#Checks for a full board
  def full?
    @board.none? {|index| index == " "}
  end


#Checks for a tie game
  def draw?
    full? && !won?
  end

#Checks if board is full or there's tie - the end of the game
  def over?
    if won?
      true
    else
      draw?
    end
  end

#Detects and names the winner
  def winner
    if !won?
      return nil
    else 
      return @board[won?[0]]
    end
  end

  
  def play
	  while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end