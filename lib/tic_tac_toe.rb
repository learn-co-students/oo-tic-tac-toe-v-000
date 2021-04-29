class TicTacToe
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

  def initialize
    @board = Array.new(9, " ")
  end

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

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    elsif @board[index] == " "
      false
    end
  end

  def valid_move?(index)
    if index < 0 || index > @board.length
      false
    elsif position_taken?(index)
      false
    elsif @board[index] == " "
      true
    end
  end

  def turn
    puts "Enter a number from 1 to 9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    return @board.count { |index| index == "X" || index == "O" }
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      index1 = combo[0]
      index2 = combo[1]
      index3 = combo[2]

      if @board[index1] == "X" && @board[index2] == "X" && @board[index3] == "X"
        return combo
      elsif @board[index1] == "O" && @board[index2] == "O" && @board[index3] == "O"
        return combo
      end
    end
    return false
  end

  def full?
    @board.all? { |item| item != " " }
  end

  def draw?
    if !won? && full?
      return true
    elsif won?
      return false
    elsif !won? && !full?
      return false
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    combo = won?
    if combo
      index = combo[0]
      @board[index]
    else
      return nil
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
