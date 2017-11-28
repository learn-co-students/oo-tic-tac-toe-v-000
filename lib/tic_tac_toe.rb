
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
  until over?
      turn
    end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def input_to_index(user_input)
  user_input.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    if @board[index] == " " && index.between?(0,8)
      true
    else
      false
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index) == true
    value = current_player
    move(index, value)
    display_board
  else
    turn
  end

  def won?
    WIN_COMBINATIONS.detect {|i| @board[i[0]] == @board[i[1]] && @board[i[0]] == @board[i[2]] && position_taken?(i[0])}
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      @board[won?.first]
    end
  end
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
end
