

class TicTacToe

  def initialize
    @board =  Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " " + @board[0] + " | " + @board[1] + " | " + @board[2] + " "
    puts "-----------"
    puts " " + @board[3] + " | " + @board[4] + " | " + @board[5] + " "
    puts "-----------"
    puts " " + @board[6] + " | " + @board[7] + " | " + @board[8] + " "
  end

  def move(input, current_player = "X")
    @board[input - 1] = current_player
  end

  def position_taken?(input)
    !(@board[input] == nil || @board[input] == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |square|
      if square == "X" || square == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    elsif turn_count % 2 != 0
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
         (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
         return combo
       end
     end
     return false
  end

  def full?
    !@board.any? do |space|
    space == " "
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won?|| draw?
      true
    else
      false
    end
  end

  def winner
    if !won?
      nil
    else
      @board[(won?)[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
