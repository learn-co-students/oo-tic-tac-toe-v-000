class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # \
    [6,4,2]  # /
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(pos, token = "X")
    @board[pos.to_i-1] = token
  end

  def position_taken?(pos)
    @board[pos] == "X" || @board[pos] == "O" # i felt this was a better way to address edge case scenarios than what the readme suggested
  end

  def valid_move?(pos)
    pos.to_i.between?(1, @board.length) && !position_taken?(pos.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    while !valid_move?(position)
      puts "Input invalid. Please select an empty sapce by inputting an integer between 1 and 9"
      position = gets.strip
    end
    move(position, current_player)
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      # win_combo is a 3 element array of indexes that compose a win, [0,1,2]
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
        return win_combo # return the win_combo indexes that won.
      end
    end
    false
  end

  def full?
    @board.all? do |token|
      token == "X" ||  token == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    win_combo = won?
    if win_combo
      return @board[win_combo[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end