class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Back diagonal
    [2,4,6]  # Front diagonal
  ]

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
  @board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3] && @board[win_index_1] != " "
    end
  end

  def full?
    @board.all? do |index|
      if index != " "
        true
    end
  end
  end

  def draw?
    # binding.pry
    !won? && full?
  end

  def over?
    if won? || draw? || full?
      true
    end
  end

  def winner
    if won?
      winning_array = won?
      return @board[winning_array[0]]
    end
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

  def move(index, current_player)
  @board[index] = current_player
  end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turn = 0
    @board.each do |board_space|
      if board_space != " "
        turn += 1
    end
    end
        return turn
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
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
  end

  def play
  counter = 0
  while counter < 9
    counter += 1
    if !over?
      turn
    elsif draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
  end


end
