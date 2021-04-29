class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right
    [0, 4, 8], # left diagonal
    [2, 4, 6]  # right diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(x)
    index = x.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " || @board[index] == nil ? false : true
  end

  def valid_move?(index)
    index.between?(0, 8) && position_taken?(index) == false
  end

  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    turn
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
    end
  end

  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    if full? && !won?
      true
    elsif !full? && !won?
      false
    elsif won?
      false
    end
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won? && @board[won?[0]] == "X"
      "X"
    elsif won? && @board[won?[0]]== "O"
      "O"
    end
  end

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
