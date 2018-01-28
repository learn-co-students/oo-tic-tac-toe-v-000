class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row horizontal
    [6,7,8],  # Bottom row
    [0,3,6],  # Left row vertical
    [1,4,7],  # Middle row vertical
    [2,5,8],  # Right row vertical
    [0,4,8],  # Diagonal Top left
    [2,4,6],  # Middle row vertical
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(position)
    return position.to_i - 1
  end

  def move(index, marker)
    @index = index
    @board[index] = marker
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    (index.between?(0,8) && !position_taken?(index))
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    index = input_to_index(position)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    return turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |arr|
      @board[arr[0]] == @board[arr[1]] && @board[arr[1]] == @board[arr[2]] && position_taken?(arr[0])
    end
  end

  def full?
    !(@board.any?{ |i| i == " " })
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      won?.each do |i|
        if @board[i] == "X"
          return "X"
        elsif @board[i] == "O"
          return "O"
        else
          return nil
        end
      end
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
