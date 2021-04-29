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
    [0,4,8], #diagonal win left top to right bottom
    [2,4,6], #diagonal win right top to left bottom
  ]
#unmodified

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
#replaced board with @board and removed argument

  def input_to_index(user_input)
    user_input.to_i - 1
  end
# unmodified

  def move(index, token = "X")
    @board[index] = token
  end
  #move removed board argument, only 2 arguments required not 3, replaced board with @board

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end
#removed board from argument, replaced board with @board

  def valid_move?(index)
    index.between?(0, 8) && !(position_taken?(index))
  end
#removed board argument, removed board argument in postition_taken?

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index) == true
       move(index, current_player)
    else
      turn
    end
  display_board
  end
#removed arguments from #turn, #valid_move?, #move(removed board only), #current_player

  def turn_count
    @board.count{|i| i != " "}
  end
#removed board argument, replaced board with @board

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
#removed arguments from current_player & turn_count

  def won?
    WIN_COMBINATIONS.find do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]
      position_1 = @board[win_index_1]

      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      position_taken?(win_index_1) && position_1 == position_2 && position_2 == position_3
    end
  end
# removed board argument, replaced board with @ board and removed board argument from #position_taken?

  def full?
    @board.none? {|i| i == " "}
  end
# removed board argument and replaced board with @board

  def draw?
    !won? && full?
  end
# removed board argument from all methods

  def over?
    won? || draw? || full?
  end
# removed board argument from all methods

  def winner
    win_combo = won?
    if win_combo
        @board[win_combo[0]] # == 'X' || 'O'
    else
        nil
    end
  end
# removed board arguments and replaced board with @board

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
#removed board arguments

end
