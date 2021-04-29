class TicTacToe

  #no arguments, new board is generated for a new game.
  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #middle_row_win
    [6,7,8], #bottom_row_win
    [0,3,6], #column_1_win
    [1,4,7], #column_2_win
    [2,5,8], #column_3_win
    [0,4,8], #diagonal_1_win
    [2,4,6] #diagonal_2_win
  ]

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @input = input.to_i-1
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(position)
    !(@board[position] == " " || @board[position].nil? || @board[position] == "")
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    count = 0
    @board.each do |turn|
      if (turn == "X" || turn == "O")
        count += 1
      end
    end
    return count
  end

  def current_player()
    turn_count()%2 == 0 ? "X": "O"
  end

  def won?()
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return win_combination
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return win_combination
      end
    end
    return false
  end

  def full?()
    @board.all? do |x|
      x == "X" || x == "O"
    end
  end

  def draw?()
    !won?() && full?()
  end

  def over?()
    draw?() || won?()
  end

  def winner()
    if won?()
      win = won?()
      return @board[win[0]]
    else
      return nil
    end
  end

  def play()
    until over?()
      turn()
    end
    if draw?()
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner()}!"
    end
  end

end
