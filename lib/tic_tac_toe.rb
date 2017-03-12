class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def move(input, char)
    @board[input] = char
  end

  def position_taken?(input)
    @board[input] != " "
  end

  def valid_move?(input)
    input.between?(0, 8) && @board[input] == " "
  end

  def turn
    puts "Please enter 1-9:"
    input = input_to_index(gets.strip)
    char = current_player


    if valid_move?(input)
      move(input, char)
      return display_board
    end

    turn
  end

  def turn_count
    counter = 0

    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end

    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      one = combo[0]
      two = combo[1]
      three = combo[2]
      x = "X"
      o = "O"

      if @board[one] == x && @board[two] == x && @board[three] == x
        return combo
      elsif @board[one] == o && @board[two] == o && @board[three] == o
        return combo
      end
    end

    false
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && full?
  end


  def over?
    if won? != false || full? || draw?
      return true
    end

    false
  end

  def winner
    if won?
      save_index = won? # array of winning combo
      return @board[save_index[0]]
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
