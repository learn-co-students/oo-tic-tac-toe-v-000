class TicTacToe

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    3.times do |i|
      3.times do |j|
          print " #{@board[(i+j) + i*2]} #{j < 2 ? '|' : ''}"
      end
      if i < 2
          puts "\n-----------"
      end
    end
  end

  def input_to_index(str)
    str.to_i - 1
  end

  def move(pos, char = 'X')
    pos = input_to_index(pos)
    @board[pos] = char
  end

  def position_taken?(pos)
    !(@board[pos].nil? || @board[pos] == " ")
  end

  def valid_move?(pos)
    pos = input_to_index(pos)
    pos >= 0 && pos <= 8 && !position_taken?(pos)
  end

  def turn
    puts "Please enter 1-9:"
    move = gets
    if valid_move?(move)
      move(move, current_player)
      display_board
    else
      turn
    end
  end

  def current_player
    if turn_count.even?
      return 'X'
    else
      return 'O'
    end
  end

  def turn_count
    @board.select {|c| c != ' ' }.size
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? {|c| position_taken?(c) && @board[c] == @board[combo[0]] }
    end
  end

  def full?
    @board.all? {|c| c != ' ' }
  end

  def draw?
    !won? && full?
  end

  def over?
    full?
  end

  def winner
    if !won?
      return nil
    end
    return @board[won?[0]]
  end

  def play
    until over? || won? || draw? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end
