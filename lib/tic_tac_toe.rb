class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Win combination indexes
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Left diagonal
    [2, 4, 6] # Right diagonal
  ]

  # Displays board with tokens, if any
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Converts user input from string to integer
  def input_to_index(input)
    input.to_i - 1
  end

  # Places token at given index
  def move(index, token)
      @board[index] = token
  end

  # Determines whether a position on the board already has a token
  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  # Determines if a position is on the board and unoccupied
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # Determines whether it's player X's or player O's turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  # Returns number of turns that have been played
  def turn_count
    count = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  # Determines current player
  def current_player
    turn_count.even? ? "X" : "O"
  end

  # Returns winning combination indexes if there is a win
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  end

  # Determines if every game board position is taken
  def full?
    @board.all? do |element|
      element == "X" || element == "O"
    end
  end

  # Finds a draw if the board is full and there wasn't a win
  def draw?
    !won? && full?
  end

  # The game is over if there was a win, a draw, or the board is full
  def over?
    won? || draw? || full?
  end

  # Congratulates winner X or O
  def winner
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
    end
  end

  # Execute the game
  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end
end
