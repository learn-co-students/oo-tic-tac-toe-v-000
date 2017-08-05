class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left Col
    [1,4,7], # Mid Col
    [2,5,8], # Right Col
    [0,4,8], # NW-SE Diag
    [2,4,6]  # NE-SW Diag
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

  def move(index, x_or_o = "X")
    @board[index] = x_or_o
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
    @board.count{|square| square == "X" || square == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    spot = input_to_index(input)
    x_or_o = current_player
    if (valid_move?(spot))
      move(spot,x_or_o)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all? do |square|
    !(square.nil? || square == " ")
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full?
  end

  def winner
    if (won? == nil)
      return nil
    else
      @board[won?.first]
    end
  end

  def play
    until over? || draw?
      turn
    end
    if (won? != nil)
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
