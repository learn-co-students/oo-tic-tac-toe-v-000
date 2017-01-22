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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    position_taken?(index) != true && index >= 0 && index <= 8
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else valid_move?(index) == false
      turn
    end
  end

  def won?
    x_moves = @board.each_index.select { |x_moves| @board[x_moves] == "X" }
    o_moves = @board.each_index.select { |o_moves| @board[o_moves] == "O" }
    WIN_COMBINATIONS.detect { |win_array|
      win_array.all? { |ary_index| x_moves.include?(ary_index) } ||
      win_array.all? { |ary_index| o_moves.include?(ary_index) }
    }
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    won? == nil && full? == true
  end

  def over?
    won? != nil || draw?
  end

  def winner
    if won? != nil
      @board[won?[0]]
    end
  end

  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
