class TicTacToe
  attr_accessor :board

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(index, char = "X")
    @board[index.to_i-1] = char
  end

  def position(index)
    @board[index.to_i]
  end

  def position_taken?(index)
    position(index) == "X" || position(index) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    elsif
    turn
  end
end

  def turn_count
    counter = 0
    @board.each do |char|
      if char == "X" || char == "O"
        counter += 1
      end
    end
  counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    position(combo[0]) == position(combo[1]) &&
    position(combo[1]) == position(combo[2]) &&
    position_taken?(combo[0])
  end
end

  def full?
    @board.all? {|char| char == "X" || char == "O"}
  end

def draw?
  full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      @winner = position(winning_combo.first)
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
