class TicTacToe

  # Array of the indexes of all possible winning combinations
  # for a given token
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end
  # Define display_board that accepts a board and prints
  # out the current state.
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  # converts the user input [1-9] into an array index [0,8].
  def input_to_index (user_input)
    index = user_input.to_i-1
  end
  # player's move
  def move(index, character)
    @board[index] = character
  end
  # returns true if position is taken.
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # returns true if the move is valid.
  def valid_move? (index)
    if (index).between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end

  # returns turns have been played.
  def turn_count
    turns_array = @board.select { |token| token == "X" || token == "O"}
    turns_array.length
  end

  # returns the current player (X or O).
  def current_player
    turn_count%2 == 1? "O":"X"
  end

  # A single complete turn
  def turn
    #ask for move
    puts "Please enter 1-9:"
    #receive user input
    input = gets.strip
    #convert user input to an index
    user_index = input_to_index(input)
    # if valid move > move and display
    # otherwise ask again for a valid move
    if (valid_move?(user_index))
      move(user_index, current_player)
      display_board
    else
      user_index = turn
    end
  end
  # returns false/nil if no win_combination.
  # returns win_combination indexes array if there is a win_combination.
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? {|win_index| @board[win_index] == "X" } || \
         win_combination.all? {|win_index| @board[win_index] == "O" }
         return win_combination
      end
    end
   false
   end
   # returns true if board is full with X and O.
   def full?

     @board.all? {|index| index == "X" || index == "O"}
   end

   # returns true if the game is full an there is no win_combination
   # returns false if board is not full and no win_combination and
   # if the board is won.
   def draw?
     !won? && full?
   end

   # returns true if the board has been won, is a draw, or is full.
   def over?
     won? || draw? || full?
   end

   # returns "X" or "O" that has won the game.
   def winner
     if won?
       return @board[won?[0]]
     else
       nil
     end
   end

   # main method of TTT
   def play
       # new turn while board is not full and game is not over
       while (!full? && !over?)
         turn
       end
       if winner
         puts "Congratulations #{winner}!"
       else
         puts "Cat's Game!"
       end
   end

end
