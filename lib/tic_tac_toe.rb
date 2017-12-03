class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    display_board
    turn until over?
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def turn
    puts "Please enter 1-9:"
    valid_move?(index = input_to_index(gets.strip)) ? move(index, current_player) : turn
    display_board
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def move(index, player)
    @board[index] = player
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def full?
    @board.none? { |i| i == " " }
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
      combo = won? ? @board[combo.first] : nil
  end

end
