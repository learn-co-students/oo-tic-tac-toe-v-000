class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # First column
    [1,4,7], # Second column
    [2,5,8], # Third column
    [0,4,8], # Diagoinal top left
    [6,4,2]  # Diagoinal top right
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = "X")
    @board[position.to_i - 1] = token
  end

  def position_taken?(position)
    @board[position] != " " || @board[position] == "" || @board[position] == nil
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Your move. Select a position from 1-9"
    input = gets.strip

    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |wins|
    if @board[wins[0]] == "X" && @board[wins[1]] == "X" && @board[wins[2]] == "X"
      wins
    elsif @board[wins[0]] == "O" && @board[wins[1]] == "O" && @board[wins[2]] == "O"
      wins
    else
      false
    end
  end
  end

  def full?
    @board.all? do |pos|
      if pos == "X" || pos == "O"
        true
      else
        false
      end
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    WIN_COMBINATIONS.detect do |wins|
    if @board[wins[0]] == "X" && @board[wins[1]] == "X" && @board[wins[2]] == "X"
      return "X"
    elsif @board[wins[0]] == "O" && @board[wins[1]] == "O" && @board[wins[2]] == "O"
      return "O"
    end
  end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end

