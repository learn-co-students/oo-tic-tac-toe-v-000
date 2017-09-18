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

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    (@board[index] ==  " " || @board[index] == "" || @board[index] == nil) ?
    false : true
  end

  def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8) ?
  true : false
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    character = current_player
    if valid_move?(index)
      move(index, character)
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
    WIN_COMBINATIONS.detect do | win_combo |
    @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] &&
    position_taken?(win_combo[0])
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
  full? && !won?
  end

  def over?
  won? || full? || draw?
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
      winning_combo = won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
  end
  end

end
