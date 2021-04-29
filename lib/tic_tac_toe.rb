class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #first column
    [1,4,7], #middle column
    [2,5,8], #end column
    [0,4,8], #left diagonal
    [2,4,6] #right diagonal
  ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i
    return user_input - 1
  end

  def move(index, player)
    @board[index] = player
    return @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else @board[index] == "X" || @board[index] = "0"
      true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end

  def turn_count
   turns = 0
   @board.each do |x_or_o|
     if x_or_o == "X" || x_or_o == "O"
       turns += 1
     end
  end
  turns
  end

  def current_player
   turn_count.even? ? "X" : "O"
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

  def won?
    WIN_COMBINATIONS.find do|win_combination|
      (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") ||
      (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
      #position_taken?(board, win_combination[0]) && position_taken?(board, win_combination[1]) && position_taken?(board, win_combination[2])
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if win_combination = won?
      return @board[win_combination.first]
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
