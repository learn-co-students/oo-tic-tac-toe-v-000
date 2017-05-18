class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0, 1, 2], #top_row_win
    [3, 4, 5], #middle_row_win
    [6, 7, 8], #bottom_row_win
    [0, 3, 6], #left_collumn_win
    [1, 4, 7], #middle_collumn_win
    [2, 5, 8], #right_collumn_win
    [0, 4, 8], #left_diagonal_win
    [2, 4, 6] #right_diagonal_win
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
  def move(index, character)
    @board[index] = character
  end
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  def valid_move?(index)
    @board[index] == " "
  end
  def turn_count
    @board.count{|character| character == "X" || character == "O"}
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all? { |index| index == "X" || index == "O"}
  end
  def draw?
    !won? && full?
  end
  def over?
    won? || draw? || full?
  end
  def winner
    if winning_combo = won?
      @board[winning_combo[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      return
    elsif draw?
      puts "Cat's Game!"
    end

  end
end
