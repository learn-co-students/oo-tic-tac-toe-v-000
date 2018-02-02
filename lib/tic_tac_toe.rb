class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9," ")
  end
  def board
    @board
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
    rows = ["   |   |   ", "-----------", "   |   |   ", "-----------", "   |   |   "]
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts rows[1]
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts rows[3]
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def valid_move?(index)
    position_taken?(index) == false && index.between?(0, 8)
  end

  def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|player| player == "X" || player == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
     @board[win[0]] == @board[win[1]] && board[win[1]] == @board[win[2]] && position_taken?(win[0])
   end
  end

  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full?
  end

  def winner
    if won? && @board[won?[0]] == "X"
      return "X"
    elsif won? && @board[won?[0]] == "O"
      return "O"
    else
    return nil
  end
  end

  def play
    while !over? && !won? && !draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
    end
  end
end
