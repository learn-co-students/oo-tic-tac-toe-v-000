class TicTacToe

  def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
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
      input.to_i - 1
    end

    def move(index, value)
      @board[index] = value
    end

    def position_taken? (index)
      if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
        return false
      else
        return true
      end
    end

    def valid_move?(index)
      if index.between?(0,8) && !position_taken?(index)
        return true
      else
        return false
    end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    if
      valid_move?(index)
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
      puts "#{counter}"
      counter += 1
    end
    end
    counter
    end

    def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
    end

    def won?
    WIN_COMBINATIONS.each do |combinations|
      if @board[combinations[0]] == "X" && @board[combinations[1]] == "X" && @board[combinations[2]] == "X"
        return combinations
      elsif @board[combinations[0]] == "O" && @board[combinations[1]] == "O" && @board[combinations[2]] == "O"
        return combinations
      end
    end
    false
    end

    def full?
    @board.all? do |input|
    input == "X" || input == "O"

    end
    end

    def draw?
      if !won? && full?
        return true
      else
        return false
    end
    end

    def over?
      if won? || draw?
        return true
      else
        return false
      end
    end

    def winner
      if won?
        @board[won?[0]]
      end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
else
puts "Cat's Game!"
end
end

end
