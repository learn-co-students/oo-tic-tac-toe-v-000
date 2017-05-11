class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,4,8], #diagonal 1
    [2,4,6], #diagonal 2
    [0,3,6], #first column
    [1,4,7], #second column
    [2,5,8]  #third column
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

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end 

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      turn
    end
    move(index, current_player)
    display_board
  end

  def won?
    # top row win consist of board[0], board[1], board[2]
    # if top row win is "X", "X", "X", or "O", "O", "O"
    # think of when the elements are all " "
    WIN_COMBINATIONS.detect{|index| @board[index[0]] == @board[index[1]] && @board[index[1]]  == @board[index[2]] && position_taken?(index[0])}
  end

  def full?
    !@board.any?{|index| index == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
      if won?
        @board[won?[0]]
      end
  end

  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
  
end