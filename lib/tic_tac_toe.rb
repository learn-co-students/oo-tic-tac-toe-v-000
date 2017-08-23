class TicTacToe

  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # left diagonal
    [2,4,6]  # right diagonal
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

  def move(index,character = "X")
    @board[index]=character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == true || index.between?(0,8) == false
      false
    else true
    end
  end

  def turn_count
    counter = 0
    @board.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      if current_player == "X"
        move(index,"X")
      elsif current_player == "O"
        move(index,"O")
      end
      display_board
    else
      turn
    end
  end

  def won?
    winning_combination = nil
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        winning_combination = win_combination
      end
    end
    if winning_combination != nil
      return winning_combination
    else
      return false
    end
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    if won? == false && full? == true
      return true
    else
      return false
    end
  end

  def over?
    [won? != false, draw?, full?].any? {|i| i == true}
  end

  def winner
    if won? != false
      win_index_1 = won?[0]
      win_index_2 = won?[1]
      win_index_3 = won?[2]
      if @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X"
        return "X"
      elsif @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
        return "O"
      end
    else
      return nil
    end
  end

  def play
    display_board
    until over? == true do
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end
