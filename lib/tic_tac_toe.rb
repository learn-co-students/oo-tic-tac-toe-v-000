class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # Left Column
    [1,4,7], # Middle Column
    [2,5,8], # Right Column
    [0,4,8], # Top Left Diagonal
    [6,4,2], # Top Right Diagonal]
  ]

  def move(location, token = "X")
    @board[location.to_i - 1] = token
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    !position_taken?(position.to_i - 1) && position.to_i.between?(1,9)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |board_space|
      if board_space == "X" || board_space == "O"
        counter += 1
      else
      end 
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_array|
      if @board[winning_array[0]] == "X" && @board[winning_array[1]] == "X" && @board[winning_array[2]] == "X"
        winning_array
      elsif @board[winning_array[0]] == "O" && @board[winning_array[1]] == "O" && @board[winning_array[2]] == "O"
        winning_array
      else
      end
    end
  end

  def full?
    @board.all? do |spaces|
        spaces == "O" || spaces == "X"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end

  end

end

