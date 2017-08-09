class TicTacToe
  # Initialize new board array with 9 empty strings, set as @board instance variable
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  # Define a WIN_COMBINATIONS constant: sets the index values for each win combination
  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right column
    [0,4,8],  # Left diagonal
    [6,4,2]   # Right diagonal
  ]

  # Define a #DISPLAY_BOARD method: prints the current board based on @board instance variable
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Define a #INPUT_TO_INDEX method: convert string to integer minus 1 (to start index at 1)
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # Define a #MOVE method: take in 2 arguments; index in @board array, player's token (default to "X")
  def move (index, player = "X")
    @board[index] = player
  end

  # Define a #POSITION_TAKEN? method: check if @board[index] is occupied
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  # Define a #VALID_MOVE? method: check if move is valid and return true if so
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8) == true
      true
    end
  end

  # Define a #TURN_COUNT method: iterate over @board index to return number of turns played
  def turn_count
    @board.count{|index| index == "X" || index == "O"}
  end

  # Define a #CURRENT_PLAYER method: use #turn_count to check IF (?) current player is "X" ELSE (:) "O"
  def current_player
    turn_count.even? ? "X" : "O"
  end

  # Define a #TURN method: get user input, call #input_to_index, call #valid_move?, call #current_player
  def turn
    # Ask user for their move
    puts "Player enter position 1-9:"
    # Receive user input
    user_input = gets.strip
    # Convert user input to index
    index = input_to_index(user_input)
    # If move is valid, make move and display board
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
    # If move invalid, run #turn again
      puts "invalid"
      turn
    end
  end

  # Define a #WON? method: return false/nil for a draw, return winning combo for win
  def won?
    # Iteration for each win_combination in the WIN_COMBINATIONS constant
    WIN_COMBINATIONS.each do |win_combination|
      # win_combination is iterating over the WIN_COMBINATIONS indexes to check for 3 matches
      # Create a numbered index variable for every win_combination
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      # Create a numbered position variable to load the value of the board at each index
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      # Check if each position is equal to "X", then return win_combination indexes that won
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      # Check if each position is equal to "O", then return win_combination indexes that won
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    # Return false for an empty board or draw
    false
  end

  # Define a #FULL? method: iterate over position to check if all full
  def full?
    # Check if every board position index contains "X" or "O" using #all?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  # Define a #DRAW? method: #full? and not #won?
  def draw?
    full? && !won?
  end

  # Define a #OVER? method: #won? OR #full? OR #draw?
  def over?
    won? || full? || draw?
  end

  # Define a #WINNER method: "X" or "O" the winner
  def winner
    # If winning_move is #won? that returns true
    if winning_move = won?
      # Then return if #winner is "X" or "O" by checking the first array (which is 0) in winning_move
      @board[winning_move[0]]
    end
  end

  # Define a #PLAY method: game loop that runs #turn method until #won? or #draw?
  def play
    # Run #turn while not #over?
    while !over?
      turn
    end
    # End game if #won?, print message
    if won?
      puts "Congratulations #{winner}!"
    # End game if #draw?, print message
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
