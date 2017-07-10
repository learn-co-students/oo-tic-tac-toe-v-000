class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left diagonal
    [2,4,6] # Right diagonal
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

  def move(input, char = "X")
    @board[input] = char
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    index = input_to_index(input)
    if valid_move?(index)
      char = current_player
      move(index, char)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |index|
      if index == "X" or index == "O"
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

  def won?
    WIN_COMBINATIONS.detect do |win_array|
      @board[win_array[0]] == @board[win_array[1]] && @board[win_array[1]] == @board[win_array[2]] && position_taken?(win_array[0])
    end
  end

  def full?
    @board.none? do |slot|
      slot == " " || slot == ""
    end
    end

    def draw?
      if full? && !won?
        return true
      end
    end

    def over?
      if won? || draw? || full?
        return true
      end
    end

    def winner
      if win_array = won?
        win = @board[win_array[0]]
        return win
      end
    end

    def play
      until over?
        turn
      end
      if won?
        win = winner
        puts "Congratulations #{win}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
end
