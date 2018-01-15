class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [2, 4, 6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    index.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    end
    "O"
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets)
    while !valid_move?(index)
      puts "Invalid move. Please enter 1-9:"
      index = input_to_index(gets)
    end
    move(index, current_player)
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      x_won = [@board[win[0]], @board[win[1]], @board[win[2]]].all? do |i|
        i == "X"
      end
      o_won = [@board[win[0]], @board[win[1]], @board[win[2]]].all? do |i|
        i == "O"
      end
      if x_won || o_won
        return win
      end
    end
    false
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    WIN_COMBINATIONS.each do |win|
      x_won = [@board[win[0]], @board[win[1]], @board[win[2]]].all? do |i|
        i == "X"
      end
      o_won = [@board[win[0]], @board[win[1]], @board[win[2]]].all? do |i|
        i == "O"
      end
      if x_won
        return "X"
      elsif o_won
        return "O"
      end
    end
    nil
  end

  def play
    until over? do
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
