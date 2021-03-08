require 'pry'
class TicTacToe
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if position_taken?(index) || index < 0 || index > 8
      false
    else
      true
    end
  end

  def turn_count
    @board.count{|turn| turn == "X" || turn == "O"}
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Specify a position between 1-9."
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
    else
      until valid_move?(index)
        puts "Invalid move. Specify a position between 1-9."
        input = gets.strip
        index = input_to_index(input)
      end
      move(index, token)
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" || @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
    end
  end

  def full?
    @board.none?{|position| position == " "}
  end

  def draw?
    full? && won? == nil
  end

  def over?
    draw? || won? != nil
  end

  def winner
    if won? == nil
      nil
    else
      @board[won?[0]]
    end
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
    won?
  end
end
