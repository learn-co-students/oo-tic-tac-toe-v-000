class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, player = "X")
    @board[index.to_i] = player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index) # when does valid move get called?
    index.to_i.between?(0,8) && !position_taken?(index.to_i)
  end

  def won?
    winning_combo = false
    WIN_COMBINATIONS.each do |combo|
      winning_x = combo.each.all? do |position|
        @board[position] == "X"
      end
      winning_o = combo.each.all? do |position|
        @board[position] == "O"
      end
      if winning_x || winning_o
        winning_combo = combo
      end
    end
    return winning_combo
  end

  def full?
    full = @board.all? do |position|
      position != " "
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    won = won?
    first_position = false
    name = nil
    if won
      first_position = won[0]
      name = @board[first_position]
    end
    return name
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    #input_to_index, #valid_move?, and #current_player
    index = input_to_index(user_input)
    if !valid_move?(index)
      turn
    end

    move(index, current_player)
    display_board
  end

  def play
    if !over?
      turn
      play
    elsif won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end


# class TicTacToe
#   def initialize(board = nil)
#     @board = board || Array.new(9, " ")
#   end
#
#   def current_player
#     turn_count % 2 == 0 ? "X" : "O"
#   end
#
#   def turn_count
#     @board.count{|token| token == "X" || token == "O"}
#   end
#
#   def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#   end
# end
