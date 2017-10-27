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

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken?(index)
      !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
      index >= 0 && index <= 8 && !position_taken?(index)
  end

  def move(index, token = "X")
      @board[index] = token
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
      WIN_COMBINATIONS.detect do |combo|
        @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
      end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    full? == true && won? == nil
  end

  def over?
    if won? || full? || draw?
      true
    end
  end

  def winner
    if won? != nil
      @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end

end
