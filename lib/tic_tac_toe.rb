class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = Array.new(9, " "))
    self.board = board
  end

  def display_board
    row(0, 1, 2)
    line
    row(3, 4, 5)
    line
    row(6, 7, 8)
  end

  def row(num1, num2, num3)
    puts " #{self.board[num1]} | #{self.board[num2]} | #{self.board[num3]} "
  end

  def line
    puts "-----------"
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    self.board[index] = token
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def position_taken?(index)
    self.board[index] == "X" || self.board[index] == "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    valid_move?(index) ? move(index, current_player) : turn
    display_board
  end

  def turn_count
    self.board.count{|x| x != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |x|
      self.board[x[0]] == self.board[x[1]] &&
      self.board[x[1]] == self.board[x[2]] &&
      position_taken?(x[0])
    end
  end

  def full?
    self.board.all?{|x| x != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? self.board[won?[0]] : nil
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
