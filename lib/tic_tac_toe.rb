class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row win
    [3,4,5], #middle row win
    [6,7,8], #bottom row win
    [0,3,6], #left column win
    [1,4,7], #middle column win
    [2,5,8], #right column win
    [0,4,8], #left diagonal win
    [2,4,6] #right diagonal win
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

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " " || @board[index] =="")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index) ? true:false
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "invalid"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |position|
      if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X"
        position
      elsif @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
        position
      else
        false
      end
    end
  end

  def full?
    @board.all? do |pos|
      pos == "X" || pos == "O"
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end

  def winner
    if winning_play = won?
      @board[winning_play.first]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
