class TicTacToe

# Set the start of the game with an empty board using an array with 9 empty strings
  def initialize(board = nil)
    @board = board || Array.new(9, " ")

  end
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # <-- Horizontal win
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # <-- Vertical win
    [0, 4, 8], [2, 4, 6] # <-- Diagonal win
  ]

# Define a method that prints the current board representation
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

# Define input_to_index which converts user input to a board index
  def input_to_index(user_input)
    user_input.to_i - 1
  end

# Define move to take 2 arguments and default to X
  def move(index, value = "X")
    @board[index] = value
  end

# position_taken is good for validation of the move
  def position_taken?(index)
    ! ( @board[index].nil? || @board[index] == " " )
  end

# Define valid_move to accept position
  def valid_move?(index)
    index.between?(0,8) && ! position_taken?(index)
  end

#Define a method to handle invalid input and ask for input again.
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)

    until valid_move?(index)
      puts "Invalid Move! Try again."
      user_input = gets.strip
      index = input_to_index(user_input)

    end

    move(index, current_player)
    display_board
  end


# Define how many turns have been played
  def turn_count
    counter = 0
    @board.each do |position|

      if position == "X" || position == "O"
    counter += 1
      end

    end
   counter
  end

# Is it an X or an O?
  def current_player
    turn_count.even? ? "X" : "O"

  end

# build won? needs WIN_COMBINATIONS to work. 8 ways to win. inspect returns a human readable array value.
# try to iterate over the combo to check if it has X or O at the indicies to win. define in terms of winner X or winner O
  def won?

    WIN_COMBINATIONS.each do |current_combo|

      win_x = current_combo.all? { |position| @board[position] == "X" }
      win_o = current_combo.all? { |position| @board[position] == "O"}

      if win_x || win_o
        return current_combo

      end
    end
      false
  end

# checking board values to determine if they are blank or nil, if not, then full.
  def full?
    @board.none? do |value|
      value == " " || value.nil?
    end
  end

# build draw? full is truthy. won is not nil. but false for won.
  def draw?
    if full?
      !won?

    else
      false
    end

  end

# over? if either of these return true, it will be true else false. != or could return an array.
  def over?
    draw? || won?
  end

# winner needs board position for winning combo
  def winner
    if !won?
      nil
    else winner = @board[won?[0]]

    end

  end

# Define your play method below
  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"

    else draw?
      puts "Cat's Game!"

    end
  end

end
