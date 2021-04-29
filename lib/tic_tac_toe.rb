class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row win
    [3, 4, 5], # Middle row win
    [6, 7, 8], # Bottom row win
    [0, 3, 6], # First column win
    [1, 4, 7], # Middle column win
    [2, 5, 8], # Last column win
    [0, 4, 8], # Left diagonal win
    [2, 4, 6]  # Right diagonal win
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else @board[index] == " " ||  @board[index] == ""
      false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = @board[index]
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
    @board.all?{|cell| cell == "X" || "O"}
    @board.none?{|cell| cell == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      winning_combo = won?
      @board[winning_combo[0]]
    else
      nil
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    end
    if winner == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  end

end
