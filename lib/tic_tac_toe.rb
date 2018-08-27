
# main TicTacToe class will be defined here
class TicTacToe
  # #initialize: assigns an instance variable @board to an array with 9 blank spaces " "
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    # WIN_COMBINATIONS: defines a constant WIN_COMBINATIONS with arrays for each win combination
    WIN_COMBINATIONS = [
      [0,1,2], # top row win combination
      [3,4,5], # middle row win combination
      [6,7,8], # bottom row win combination
      [0,3,6], # left column win combination
      [1,4,7], # middle column win combination
      [2,5,8], # right column win combination
      [0,4,8], # left diagonal win combination
      [2,4,6]  # right diagonal win combination
    ]

    # desribe display_board: prints arbitrary arrangements of the board
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    # describe input_to_index
    # accepts the user's input (a string) as an argument
    # converts the user's input (a string) into an integer
    # converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format (where the first index starts at 0)" do
    def input_to_index(user_input)
      user_input.to_i - 1 # user_input converted to an integer
    end

    # describe '#move': allows "X" player in the top left and "O" in the middle
    def move(position, char)
      @board[position] = char
    end

    # position_taken?: returns true/false based on whether the position on the board is already occupied
    def position_taken?(index_i)
      ((@board[index_i] == "X") || (@board[index_i] == "O"))
    end

    # valid_move?: returns true/false based on whether the position is already occupied
    # checks that the attempted move is within the bounds of the game board
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    # turn_count: counts occupied positions
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    # current_player: returns the correct player, X, for the third move
    # returns the correct player, O, for the fourth move
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    # turn: receives user input via the gets method
    # calls #input_to_index, #valid_move?, and #current_player
    # makes valid moves and displays the board
    # asks for input again after a failed validation
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      char = current_player
      if valid_move?(index)
        move(index, char)
        display_board
      else
        turn
      end
    end

    # won?: returns false for a draw
    # returns the winning combo for a win
    def won?
      WIN_COMBINATIONS.detect do |win_combo|
        if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
          return win_combo
        elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
          return win_combo
        end
          false
      end
    end

    # full?: returns true for a draw
    # returns false for an in-progress game
    def full?
      @board.all?{|occupied| occupied != " "}
    end

    # draw?: returns true for a draw
    # returns false for a won game
    # returns false for an in-progress game
    def draw?
      !(won?) && (full?)
    end

    # over?: returns true for a draw
    # returns true for a won game
    # returns false for an in-progress game
    def over?
      won? || full? || draw?
    end

    # winner?: return X when X won
    # returns O when O won
    # returns nil when no winner
    def winner
      WIN_COMBINATIONS.detect do |win_combo|
        if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
          return "X"
        elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
          return "O"
        else
          nil
        end
      end
    end

    # play: asks for players input on a turn of the game
    # hecks if the game is over after every turn
    # plays the first turn of the game
    # plays the first few turns of the game
    # checks if the game is won after every turn
    # checks if the game is draw after every turn
    # stops playing if someone has won
    # congratulates the winner X
    # congratulates the winner O
    # stops playing in a draw
    # prints "Cat\'s Game!" on a draw
    # plays through an entire game
    def play
      while over? == false
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

  end
