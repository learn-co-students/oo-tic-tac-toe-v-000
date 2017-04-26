class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left columns
    [1, 4, 7], #middle columns
    [2, 5, 8], #right columns
    [0, 4, 8], #diagonal 1
    [2, 4, 6] #diagonal 2
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

  def move(position, char)
    @board[position] = char
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    elsif @board[index] == " " || ""
      return false
    end
  end

  def valid_move?(index)
    if index >= 0 && index <8  && position_taken?(index) == false
      return true
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
    if space == "X"
        counter += 1
      elsif space == "O"
          counter += 1
      end
    end
  return counter
  end

  def current_player
    if turn_count() % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else turn()
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all? do |space|
      space == "X" ||
      space == "O"
    end
  end

  def draw?
    if  !won?() && full?()
        return true
    else return false
    end
  end

  def over?
    if won?() ||
      draw?() ||
      full?()
      return true
    else return false
    end
  end

  def winner
    if winning_combo = won?()
      @board[winning_combo[0]]
    else
    end
  end

  def play
    until over?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end

end
