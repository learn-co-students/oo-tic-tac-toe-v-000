class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts    " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts    "-----------"
    puts    " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts    "-----------"
    puts    " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end# Define display_board that accepts a board and prints
  # out the current state.

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
         @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O" ||
         @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
      end
  end

  def full?
      @board.all? do |space|
        space == "O" || space == "X"
    end
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if draw? ||full? || won?
      return true
    end
  end

  def winner
    if draw? || !won?
      return nil
    end
     index = won?
    return @board[index[1]]
  end

  def input_to_index (input)
    return input.to_i - 1
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move? (index)
    index.between?(0,9) && position_taken?(index) == false
  end

  def move (index, current_player)
      @board[index] = current_player
      @board
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

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
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

  def play
      until over?
        current_player
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      end
      if draw?
        puts "Cat's Game!"
      end

  end

end
