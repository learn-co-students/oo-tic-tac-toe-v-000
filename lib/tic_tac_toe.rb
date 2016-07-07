class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def move(input, value = "X")
    index = input.to_i - 1
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.to_i < 1 || index.to_i > 9
      false
    else
      !(position_taken?(index.to_i - 1))
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index)
      move(index)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position != " "
        counter +=1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    elsif turn_count % 2 == 1
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_index|
      if @board[win_index[0]] != " " && @board[win_index[0]] == @board[win_index[1]] && @board[win_index[1]] == @board[win_index[2]]
        return win_index
      end
    end
    return false
  end

  def full?
    @board.all? do |value|
      value == "X" || value == "O"
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
    if draw?
      return true
    elsif won?
      return true
    else
      return false
    end
  end

  def winner
    if win = won?
      @board[win.first]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end
end
