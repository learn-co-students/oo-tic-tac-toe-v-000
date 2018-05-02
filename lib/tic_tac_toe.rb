class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
    # Play until someone wins or there is a draw
    turn until over?
    # Congratulate the winner
    won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
    # Ask if they'd like to play again
    # puts "Would you like to play again? (Y or N)"
    # If yes, then #play again
    # gets.strip.downcase == "y" || gets.strip.downcase == "yes" ? play : puts("Goodbye!")
  end

  # #turn gets the player's move, checks that the move is valid, then updates the board with the new move and finally displays the board.
  # Called by #play
  def turn
    puts "Please enter a number 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "invalid"
      turn
    end
  end

  # #input_to_index converts the player's choice of position to the corresponding index in the board array.
  # Called by #turn
  def input_to_index(input)
    input.to_i - 1
  end

  # #valid_move? checks to see if current player's move choice is both available and a position on the board (has an index between 0-8)
  # Called by #turn
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # #position_taken? checks to see if a position on the board is already occupied by an "X" or "O".
  # Called by #valid_move
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # #move updates the board array with the current player's valid move choice
  # Called by #turn
  def move(index, token = "X")
    @board[index] = token
  end

  # #current_player checks which turn it is to determine if it's X or O's turn
  # Called by #move and by #turn
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # #turn_count keeps track of the number of turns that have been taken
  # Called by #current_player
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  # #display_board displays an ascii Tic Tac Toe board.
  # Called by #turn
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # #over? checks to see if the game has been won or is a draw. If so, the game is over.
  def over?
    won? || draw?
  end

  # #won? checks to see if a winning combination exists
  def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end

  # WIN_COMBINATIONS holds 8 possible winning combinations of 3 board positions
  WIN_COMBINATIONS = [
    #Board layout
    # 0 | 1 | 2
    #-----------
    # 3 | 4 | 5
    #-----------
    # 6 | 7 | 8

    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left col
    [1,4,7],  # Middle col
    [2,5,8],  # Right col
    [0,4,8],  # Diagnol 1
    [2,4,6]  # Diagnol 2
  ]

  # #draw? checks to see if the board is full, but there is no winning combination
  def draw?
    !won? && full?
  end

  # #full? checks to see if the board is full, ie no empty spaces remain
  def full?
    !@board.any?{|x| x == "" || x == " "}
  end

  # #winner checks to see what kind of token is in the winning combination, if one exists
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

end
