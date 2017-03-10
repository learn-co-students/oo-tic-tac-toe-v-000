class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],  # Top row
    [3, 4, 5],  # Middle row
    [6, 7, 8],  # Bottom row
    [0, 3, 6],  # Left column
    [1, 4, 7],  # Middle column
    [2, 5, 8],  # Right column
    [0, 4, 8],  # Left diagonal
    [2, 4, 6]   # Right diagonal
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    dash_lines = "-----------"

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts dash_lines
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts dash_lines
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    @board.count { |element| element == "X" || element == "O" }
  end

  def current_player
    ( turn_count.even? ) ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.chomp)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board[combination[0]] == @board[combination[1]] &&
      @board[combination[1]] == @board[combination[2]] &&
      position_taken?(combination[0])
    end
  end

  def full?
    @board.all? { |element| element == "X" || element == "O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won_by = won?

    @board[won_by[0]] if won_by
  end

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
