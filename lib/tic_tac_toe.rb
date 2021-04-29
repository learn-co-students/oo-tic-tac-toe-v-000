class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Win combinations constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right colum
    [0,4,8], # Left diagonal
    [2,4,6] # Right diagnoal
  ]

# Displays board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Converts user input to index
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # Accepts move from player
  def move(index, token = "X")
    @board[index] = token
  end

  # Evaluates whether position is taken
  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end

  # Evaluates whether move is valid
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # Single player turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  # Returns number of turns played
  def turn_count
    completed_turns = 0
    @board.each do |token|
    if token == "X" || token == "O"
        completed_turns += 1
      end
    end
    completed_turns
  end

  # Determines current_player
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  # Checks whether game has been won
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        return win_combo
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
        return win_combo
      end
    end
      false
  end

  # Checks whether board is full
  def full?
    @board.all? do |taken|
      taken != " "
    end
  end

  # Checks whether game has ended in a draw
  def draw?
    !won? && full?
  end

  # Checks whether game is over
  def over?
    won? || draw? || full?
  end

  # Declares winner if game has been won
  def winner
    if won?
      new_win_combo = won?
        if @board[new_win_combo[0]] == "X" && @board[new_win_combo[1]] == "X" && @board[new_win_combo[2]] == "X"
          return "X"
        elsif @board[new_win_combo[0]] == "O" && @board[new_win_combo[1]] == "O" && @board[new_win_combo[2]] == "O"
          return "O"
        end
      end
  end

# Plays game of Tic Tac Toe
  def play
    until over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end
