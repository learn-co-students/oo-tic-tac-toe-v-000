class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top-row win
    [3,4,5], #mid-row win
    [6,7,8], #bottom-row win
    [0,3,6], #left col win
    [1,4,7], #mid col win
    [2,5,8], #right col win
    [0,4,8], #left diag win
    [2,4,6]  #right diag win
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all? {|index| @board[index] == "X"} ||
      win_combo.all? {|index| @board[index] == "O"}
    end
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    if !won? && full?
      return true #true if -- board has not been won and is full
    elsif won? && full?
      return false #false if -- board is won and is full
    else false #false if -- board has not been won and is NOT full (in progress game)
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else false
    end
  end

  def winner
    if !won?
      return nil
    else @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if over? && draw? #if over and full but no winner
      puts "Cat's Game!"
    elsif over? && winner #if over and full with winner
      puts "Congratulations #{winner}!"
    end
  end

end
