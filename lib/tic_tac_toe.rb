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
    user_input = user_input.to_i
    user_input = user_input - 1
  end

  def move(user_input, token="X")
    @board[user_input] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

    def turn_count
    counter = 0
    @board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    elsif counter == " "
      counter = counter
    end
  end
  return counter
  end

  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
      "O"
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
    WIN_COMBINATIONS.detect do |win_combination|
      position_taken?(win_combination[0]) && @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]]
    end
  end

  def full?
   @board.each do |index|
     if index == " "
       return false
   end
   end
  end

  def draw?
    full? && !won?
  end

  def over?
    if draw? == true
      return true
    elsif full? == false || full? == nil && won? == false || won? == nil
      return false
    elsif won? != false || won? != nil
      return true
    end
  end

  def winner
    if won? == false || won? == nil
      return nil
    else
      return @board[won?[0]]
    end
  end

  def play
    until over? || won? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
