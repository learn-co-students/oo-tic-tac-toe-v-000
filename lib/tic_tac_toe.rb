class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == " " || @board[index] == nil)
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn()
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
  end

  def turn_count()
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
  end
  return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 == 1
      return "O"
    end
  end

  def won?()
    WIN_COMBINATIONS.detect do |win_array|
      @board[win_array[0]] == @board[win_array[1]] &&
      @board[win_array[1]] == @board[win_array[2]] &&
      position_taken?(win_array[0])
    end
  end

  def full?()
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end

  def draw?()
    !won?() && full?()
  end

  def over?()
    won?() || draw?() || full?()
  end

  def winner()
    if win_index = won?
      @board[win_index.first]
    end
  end
end
