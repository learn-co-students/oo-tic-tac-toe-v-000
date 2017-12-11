class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left collumn
    [1,4,7], # middle collumn
    [2,5,8], # right collumn
    [0,4,8], # diagonal L to R
    [2,4,6] # diagonal R to L
  ]

  # outputs current board representation
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # converts players input to actual index on board
  def input_to_index(input)
    input.to_i - 1
  end

  # makes the move
  def move(index, token = "X")
    @board[index] = token
  end

  # checks if index is taken or not
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # checks if move is valid on board, and not taken
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # completes one full turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index)
      current_player
      display_board
    else
      turn
    end
  end

  # determine how many turns have been made
  def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
        counter += 1
    end
   end
   return counter
  end

  # determine if it's X's or O's turn
  def current_player
    if turn_count % 2 == 0
         "X"
    elsif turn_count % 2 == 1
         "O"
    end
  end

  # false for no win/draw, returns winning array
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  # checks if board is full
  def full?
    @board.all? { |token| token == "X" || token == "O" }
  end

  # checks if game ends in draw
  def draw?
   !won? && full?
  end

  # checks if game is over
  def over?
   won? || draw? || full?
  end

  # tells us who the winner is
  def winner
   if winning_combo = won?
     @board[winning_combo.first]
   end
  end

  # plays/loops through game 9 times
  def play
   while !over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   else draw?
     puts "Cat's Game!"
   end
  end

end #end of class
