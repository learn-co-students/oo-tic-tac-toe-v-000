class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
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

  def turn_count
    @board.count{|token| token =="X" || token == "O"}

  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken?(index)
    ["X", "O"].include?(@board[index])
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(answer)
    index = answer.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    #require 'pry'
    #binding.pry
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end


  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      @board[combo[0]] != " "
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    until over?
      turn
      #require 'pry'
      #binding.pry
    end
    if won?
      #winner = winner(@board)
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
