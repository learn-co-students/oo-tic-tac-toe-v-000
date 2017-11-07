class TicTacToe
  #WIN_COMBINATIONS
  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2],
    ]
  #initialize
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end
  #diplay_board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  #input_to_index
  def input_to_index(input)
    input.to_i - 1
  end
  #move
  def move(index, char)
    @board[index] = char
  end
  #position_taken?
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      false
    end
  end
  #valid_move?
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      true
    else
      false
    end
  end
  #turn_count
  def turn_count
    counter = 0
    @board.each do |count|
      if count == "X" || count == "O"
        counter += 1
      end
    end
    counter
  end
  #current_player
  def current_player
    turn_count.even? ? "X" : "O"
  end
  #turn
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
  #won?
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|win_index| @board[win_index] == "X" } ||
      win_combination.all? {|win_index| @board[win_index] == "O" }
    end
  end
  #full?
  def full?
    @board.all? {|board_position| %w[X O].include?(board_position)}
  end
  #draw?
  def draw?
    !won? && full?
  end
  #over?
  def over?
    won? || draw?
  end
  #winner?
  def winner
    won? && @board[won?[0]]
  end
  #play
  def play
    turn until over?
    # Game is over, figure out why.
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end
