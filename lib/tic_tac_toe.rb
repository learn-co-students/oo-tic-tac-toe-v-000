require "pry"
class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
  #  @board[index] == "X" || @board[index] == "O"
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
    count = 0
    @board.each do |token|
      if token != " "
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9."
    input = gets.chomp
    index = input_to_index(input)
    token = current_player
    #binding.pry
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
      win_position_1 = @board[winning_combo[0]]
      win_position_2 = @board[winning_combo[1]]
      win_position_3 = @board[winning_combo[2]]

      win_position_1 == "X" && win_position_2 == "X" && win_position_3 == "X" ||
      win_position_1 == "O" && win_position_2 == "O" && win_position_3 == "O"
    end
  end

  def full?
    @board.all? do|index|
      index == "X" || index == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
