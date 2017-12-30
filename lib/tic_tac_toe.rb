class TicTacToe
  attr_accessor :board, :index

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  SYMBOLS = %w(X O)

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def position_taken?(index)
    board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && (0..8).include?(index)
  end

  def turn_count
    board.count { |space| %w(X O).include?(space) }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def move(index, current_player)
    board[index] = current_player
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      inputs = gets.strip
      index = input_to_index(input)
    end
  end

  def won?
    WIN_COMBINATIONS.find do |row|
      row.all? do |index|
        winner = board[row[0]]
        board[index] == winner && winner != " "
      end
    end
  end

  def full?
    !board.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    board[won?[0]] if won?
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
