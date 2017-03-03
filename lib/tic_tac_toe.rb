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
    @index = input.to_i - 1
  end
  def move(index, token)
    @board[index] = token
  end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(index)
    if position_taken?(index) == true
      false
    elsif index.between?(0, 8) && position_taken?(index) == false
      true
    end
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, token = current_player)
    else
      turn
    end
    display_board
  end
  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
      winning_combo.all?{|x| @board[x] == "X"} ||
      winning_combo.all?{|x| @board[x] == "O"}
    end
  end
  def full?
    @board.all?{|x| x == "X" || x == "O"}
  end
  def draw?
    !won? && full? ? true : false
  end
  def over?
    won? || draw? || full? ? true : false
  end
  def winner
    won_array = won?
    won_array ? @board[won_array[0]] : nil
  end
  def play
    turn until over?
    puts draw? ? "Cat's Game!" : "Congratulations #{winner}!"
  end
end
