
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
    [0,4,8], #left vertical win
    [2,4,6] #right vertical win
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

  def move(index, token)
     @board[index]= token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"

  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
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
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      win_index_1 = win[0] #top row win
      win_index_2 = win[1] #middle row win
      win_index_3 = win[2] #bottom row win
      win_index_4 = win[3] #left column win
      win_index_5 = win[4] #middle column win
      win_index_6 = win[5] #right column win
      win_index_7 = win[6] #left diagonal win
      win_index_8 = win[7] #right diagonal win

      @board[win[0]] == @board[win[1]] &&
      @board[win[1]] == @board[win[2]] &&
      position_taken?(win[0])

    end
  end

  def full?
  @board.all? do |position|
    position != " "
  end
end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      @board[win_combo.first]
end
end

  def play
    until over?
    turn
    end

    if winner == "X"
       puts "Congratulations X!"
     elsif winner == "O"
       puts "Congratulations O!"
     else draw?
       puts "Cat's Game!"
    end
  end
end
