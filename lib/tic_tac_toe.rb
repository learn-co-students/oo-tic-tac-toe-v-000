class TicTacToe
  attr_reader :board

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ]

  board = @board

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(integers)
    integers.to_i - 1
  end

  def move(index, token = "X")
    board[index] = token
  end

  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    end
  end

  def turn_count
    board.count do |taken|
      taken == "X" || taken == "O"
    end
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_numbers|
      board[winning_numbers[0]] == board[winning_numbers[1]] && board[winning_numbers[2]] == board[winning_numbers[0]] && position_taken?(winning_numbers[0])
    end
  end

  def full?
    board.none? do |x|
      x == " "
    end
  end
  
  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_game = won?
      board[winning_game.first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end