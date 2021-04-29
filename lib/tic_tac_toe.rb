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
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(index, value)
    @board[index] = value
  end
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    counter = 0
    @board.each do |plays|
      if plays == "X" || plays == "O"
        counter += 1
      end
    end
    counter
  end
  def current_player
    if turn_count.even?
      value = "X"
    else
      value = "O"
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
  def won?
    WIN_COMBINATIONS.detect do |win|
      @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
    end
  end
  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end
  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end
  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end
  def winner
    if won?
      @board[won?.first]
    end
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
end
