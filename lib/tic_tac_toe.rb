class TicTacToe

  # initialize
  def initialize(board = nil)
    @board = Array.new(9, " ")
    display_board
  end

  # winning combinations
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4 ,5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # main diagonal
    [2, 4, 6] # off diagonal
  ]

  # display_board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # input_to_index
  def input_to_index(input)
    index = input.to_i - 1
  end

  # move
  def move(index, value)
    @board[index] = value
  end

  # position_taken?
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  # valid_move?
  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      return true
    else
      return false
    end
  end

  # turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    until valid_move?(index) == true
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end

    move(index, value = current_player)
    display_board
  end

  # turn_count
  def turn_count
    counter = 0
    @board.each do |element|
        element == " " ? counter : counter += 1
    end
    return counter
  end

  # current_player
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # won?
  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        return combination
      elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        return combination
      end
    end
    return false
  end

  # full?
  def full?
    @board.none?{|i| i == " "}
  end

  # draw?
  def draw?
    full? == true && !won?
  end

  # over?
  def over?
    draw? || won?
  end

  # winner
  def winner
    if won?
      return @board[won?[0]]
    end
  end

  # play
  def play
    while over? == false
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
