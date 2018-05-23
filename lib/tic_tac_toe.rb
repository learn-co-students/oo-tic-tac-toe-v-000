class TicTacToe
  attr_accessor :board

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

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "----------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "----------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input_string)
    input_string.to_i - 1
  end

  def move(pos, sym)
    @board[pos] = sym
  end

  def position_taken?(pos)
    @board[pos] == "X" || @board[pos] == "O"
  end

  def valid_move?(pos)
    !position_taken?(pos) && pos.between?(0, 9)
  end

  def turn_count
    @board.count {|pos| pos == "X" || pos == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    print "Please enter a number: "
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? {|num| @board[num] == "X"}
      return combo if combo.all? {|num| @board[num] == "O"}
    end
    false
  end

  def full?
    @board.none? {|pos| pos == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
