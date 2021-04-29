require 'pry'
class TicTacToe

  #initialize: assigns an instance variable @board to an array with 9 blank spaces " "
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  #WIN_COMBINATIONS--------------------------------------#
    #defines a constant WIN_COMBINATIONS with arrays for each win combinationre
  WIN_COMBINATIONS =[ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  # DISPLAY_BOARD-------------------------------------#
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "---------------------------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "---------------------------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # INPUT_TO_INDEX--------------------------------------#
    #accept user input as argument, convert the string into integer, minus 1 for array indexes protocol of beginning with a zero
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # MOVE-------------------------------------------------#
    #player's token and board position are taken in to board array(but not yet validated) '
  def move(position, player_token = "X")
    @board[position] = player_token
  end

  #POSITION_TAKEN--------------------------------------#
    #returns true/false based on whether the position on the board is already occupied
  def position_taken?(position)
    if @board[position] == " " || @board [position] == "" || @board [position] == nil
      false
    else
      true
    end
  end

  #VALID_MOVE?--------------------------------------#
    #returns true/false based on whether the position is on game board and if it's occupied.
  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8) == true
  end

  #TURN_COUNT---------------------------------------#
    #Count how many turns have been played.
  def turn_count
    counter = 0
    @board.each do |player_token|
      if player_token == "X" || player_token == "O"
      counter += 1
      end
    end
    counter
  end

  #CURRENT_PLAYER--------------------------------#
    #Will return, based on #turn_count, an `"X"` or an '"O"' and this will tell us whose turn it is.
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  #TURN--------------------------------------#
    #Ask user for their move by position 1-9. Converts user input to an index.If move is valid, make the move and display board. If move is invalid ask for a new position until a valid move is received.
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    position = input_to_index(input)
    if valid_move?(position)
      move(position,current_player)
      display_board
    else
      turn #recursive
    end
  end

  # WON?---------------------------------------#
    #The first return of 3 tokens in a row (in any direction) will determine someone has won.
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]]== @board[win_combo[2]] && position_taken?(win_combo[0])
        win_combo
      else
         false
      end
    end
  end

  #FULL?---------------------------------------#
    #returns true for a draw, returns false for an in-progress game
  def full?
    @board.all? do |square|
      square == "X" || square == "O"
   end
  end

  # #DRAW?---------------------------------------#
    # calls won? calls full?
    # returns true for a draw, returns false for a won game, returns false for an in-progress game
    def draw?
      full? && !won?
  end

  #OVER?---------------------------------------#
    #returns true for a draw, returns true for a won game ,returns false for an in-progress game
  def over?
    won? ||  draw?
  end

  #WINNER---------------------------------------#
    #return "X" when "X" won, returns "O" when "O" won, returns nil when no winner
    def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  #PLAY--------------------------------------#
  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations " + winner + "!"
      else
       puts "Cat's Game!"
    end
  end
end
