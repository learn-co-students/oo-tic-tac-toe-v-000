class TicTacToe

  attr_accessor :board


  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, char = "X")
    @board[index.to_i-1] = char
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == nil)
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def turn
    input = gets.strip
    if valid_move?(input)
      move(input)
    display_board
  else
    turn
  end
end

def turn_count

  @board.count do |char|
    char == "X" || char == "O"
    end
end

def current_player
  if turn_count % 2 == 0
    "X"
  else turn_count % 2 == 1
    "O"
end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    position(combo[0]) == position(combo[1]) &&
    position(combo[1]) == position(combo[2]) &&
    position_taken?(combo[0])
end
end

def position(index)
  @board[index.to_i]
end

def full?
  @board.all? {|char| char == "X" || char == "O"}
end

def draw?
  !won? && full?
end

def over?
  draw? || won?
end

def winner
  if winning_combo = won?
    @winner = position(winning_combo.first)
  end
end
end
