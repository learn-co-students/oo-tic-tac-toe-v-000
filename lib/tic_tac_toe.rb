class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
    @board[location.to_i-1] = token
  end

  def position_taken?(location)
    !(@board[location.to_i] == " ") || (@board[location.to_i].nil?)
  end

  def valid_move?(location)
    index = location.to_i-1
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, token = current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    taken = 0
    @board.each do |space|
      if space == "X" || space == "O"
        taken += 1
      end
    end
    taken
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    win = false
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|i| @board[i] == "X"} ||
        win_combination.all?{|i| @board[i] == "O"}
        win = win_combination
      end
    end
    win
  end

  def full?
    @board.all?{|i| (i == "X" || i == "O")}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    winner = won?
    if winner
      return @board[winner[0]] || @board[winner[0]]
    end
    nil
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
