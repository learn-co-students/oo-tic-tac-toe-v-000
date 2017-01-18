class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # TOP ROW
    [3,4,5], # MIDDLE ROW
    [6,7,8], # BOTTOM ROW
    [0,3,6], # FIRST COLUMN
    [1,4,7], # SECOND COLUMN
    [2,5,8], # THIRD COLUMN
    [0,4,8], # DESCENDING SLOPE
    [2,4,6]  # ASCENDING SLOPE
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
        index = input.to_i - 1
  end

  def move(index, value = "X")
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == "X" ||  @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if position_taken?(index) == true
     return false
    elsif position_taken?(index) == false
     if index.between?(0, 8) == true
       return true
     else
       return false
     end
    end
  end

  def turn_count
    counter = 0
    @board.each do |value|
      if value == "X" || value == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, value = current_player)
    else
      puts "try again"
      turn
    end
    display_board
  end

  def won?
    if @board.all?{|i| i == " "}
      return false
    end
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    return false
  end

  def full?
    if @board.include?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    if won? == false && full? == true
      return true
    elsif full? == false
      return false
    end
  end

  def over?
    if won? != false || full? == true || draw? == true
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
    end
  end

  def play
    display_board
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? != false
      puts "Cat's Game!"
    end
  end
end
