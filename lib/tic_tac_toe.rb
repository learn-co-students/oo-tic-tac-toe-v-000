class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # First Column
    [1,4,7], # Second Column
    [2,5,8], # Third Column
    [0,4,8], # Right Diagonal
    [2,4,6]  # Left Diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
  index = input_to_index(input)
  player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
  @board.each do |token|
  if  token == "X" || token == "O"
      counter += 1
    end
  end
    return counter
  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      combination.all? {|i| @board[i] == "X"} || combination.all? {|i| @board[i] == "O"}
    end
  end

  def full?
    @board.none? {|i| i == "" || i == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif
      draw?
      puts "Cat's Game!"
    end
  end
end
