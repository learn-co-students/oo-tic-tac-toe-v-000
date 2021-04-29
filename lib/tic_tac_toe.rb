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
    @index = input.to_i - 1
  end

  def move(index, char = "X")
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if (index.between?(0, 8) && position_taken?(index) == false)
        return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
      if valid_move?(index) == true
        move(index, current_player)
      else
        turn
      end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
      counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all?{|i| @board[i] == "X"} || win_combo.all?{|i| @board[i] == "O"}
        return win_combo
      elsif @board.all?{|i| i == " "} || @board.all?{|i| i == ""} || @board.all?{|i| i == nil}
        return false
      end
    end
    false
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
    end
  end
end
