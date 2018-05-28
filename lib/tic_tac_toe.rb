require "pry"

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Down diagonal
    [6, 4, 2] # Up diagonal
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
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(index, current_player)
    @board[index] = current_player
  end
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
    move(index, current_player)
    display_board
    else
    turn
    end
  end
  def turn_count
  counter = 0
  @board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
  end
  def current_player
    player = "X"
    if turn_count % 2 != 0
    player = "O"
    end
    player
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  def full?
    @board.all? do |cell|
    cell == "X" || cell == "O"
    end
  end
  def draw?
    full? && !won?
  end
  def over?
    full? || draw? || won?
  end
  def winner
    if won?
      index = won?[0]
      @board[index]
    end
  end
  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end
