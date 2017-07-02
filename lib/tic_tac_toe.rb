class TicTacToe
#constant
  WIN_COMBINATIONS = [
						        [0,1,2],
						        [3,4,5],
						        [6,7,8],
						        [0,3,6],
						        [1,4,7],
						        [2,5,8],
						        [0,4,8],
						        [6,4,2]]
#initialize the board
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

#display_board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

# Helper Method
  def input_to_index(user_input)
    user_input.to_i - 1
  end

# Helper Method
  def move(index, current_player)
   @board[index] = current_player
  end

  # Helper Method
  def position_taken?(index)
  	!(@board[index].nil? || @board[index] == " ")
  end

# Helper Method
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

# Helper Method
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

# Helper Method
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # Helper Method
  #TURN
  def turn
    puts "Please enter 1-9:"
    #get input
    user_input = gets.strip

    #convert input to index
    index = input_to_index(user_input)

    # check if index is valid
    if valid_move?(index)
      #make the move for index
      move(index, current_player)
    else
      #ask for input again until you get a valid input
      turn
    	end
    	#show the board
    	display_board
    end

# Helper Method
def won?
	WIN_COMBINATIONS.find do |win|
	 @board[win[0]] == @board[win[1]] && @board[win[0]] == @board[win[2]] && @board[win[0]] != " "
 end
end

# Helper Method
def full?
 !@board.include?(" ") || @board.include?("")
end

# Helper Method
def draw?
	full? && !won?
end

# Helper Method
def over?
	won? || draw?
end

# Helper Method
def winner
	if win = won?
		@board[win[0]]
	end
end

# Helper Method
def play
  turn until over?
  puts winner ?  "Congratulations #{winner}!" : "Cat's Game!"
end
end
####################################################
#initialize
#WIN_COMBINATIONS
##display_board
#input_to_index
#moves
#position_taken?
#valid_move?
#turn_count
#current_player
#turn
#won?
#full?
#draw?
#over?
#winner?
#play
#asks for players input on a turn of the game (FAILED - 26)
      #checks if the game is over after every turn (FAILED - 27)
      #plays the first turn of the game (FAILED - 28)
      #plays the first few turns of the game (FAILED - 29)
      #checks if the game is won after every turn (FAILED - 30)
      #checks if the game is draw after every turn (FAILED - 31)
      #stops playing if someone has won (FAILED - 32)
      #congratulates the winner X (FAILED - 33)
      #congratulates the winner O (FAILED - 34)
      #stops playing in a draw (FAILED - 35)
      #prints "Cat's Game!" on a draw (FAILED - 36)
      #plays through an entire game (FAILED - 37)
