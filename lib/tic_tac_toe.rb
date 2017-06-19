class TicTacToe
  # initialize : assigns an instance variable @board to an array with 9 blank spaces
  def initialize( board = nil )
    @board = board || Array.new( 9, " ")
  end

  # WIN_COMBINATIONS : defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [
      # Top row win
      [0, 1, 2],

      # Middle row win
      [3, 4, 5],

      # Bottom row win
      [6, 7, 8],

      # Left column win
      [0, 3, 6],

      # Middle column win
      [1, 4, 7],

      # Right column win
      [2, 5, 8],

      # Diagonal win 1
      [0, 4, 8],

      # Diagonal win 2
      [2, 4, 6]
    ]

  # display_board : prints arbitrary arrangments of the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # input_to_index : accepts the user's input ( a string ) as an argument
    # converts the user's input ( a string ) into an integer
    # converts the user's input from the user-friendly format ( on a 1-9 scale ) to the array-friendly format ( where the first index starts at 0 )
  def input_to_index( user_input )
    user_input.to_i - 1
  end

  # move : allows "X" player in the top left and "O" in the middle
  def move( index, current_player = "X" )
    @board[index] = current_player
  end

  # position_taken : returns true/false based on whether the position on the board is already occupied
  def position_taken?( index )
    !(@board[index].nil? || @board[index] == " ")
  end

  # valid_move : returns true/false based on whether the position is already occupied
  def valid_move?( index )
    if position_taken?( index ) == true || !index.between?(0,9)
      return false
    else
      return true
    end
  end

  # turn_count : counts occupied positions
  def turn_count
    counter = 0
    @board.each do |positions|
      if positions == "X" || positions == "O"
        counter += 1
      end
    end
    counter.to_i
  end

  # current_player : returns the correct player, X, for the third move
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  # turn : receives user input via the gets method
    # calls #input_to_index, #valid_move?, and #current_player
    # makes valid moves and displays the board
    # asks for input again after a failed validation
  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp
    user_input = input_to_index( user_input )
    if valid_move?( user_input ) == true
      puts "Valid move was made"
      character = current_player
      move( user_input, character )
      display_board
    else
      while valid_move?( user_input ) == false
        puts "Please enter a valid move: "
        user_input = gets.chomp
        user_input = input_to_index( user_input )
      end
      if valid_move?( user_input ) == true
        puts "Valid move was made"
        character = current_player
        move( user_input, character )
        display_board
      end
    end
  end

  # won? : returns false for a draw
  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |c| position_taken?( c ) && @board[c] == @board[ combo[0] ] }
    end
  end

  # full? : returns true for a draw
  def full?
    @board.all? do |position|
      position != " "
    end
  end

  # draw? : returns true for a draw
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  # over? : returns true for a draw
  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  # winner : return X when X won
  def winner
    if won?
      return @board[ won?[0] ]
    else
      return nil
    end
  end

  # play : asks for players input on a turn of the game
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{ winner }!"
    elsif draw?
      puts "Cat's Game!"
    else
      puts "Game over"
    end
  end

end
