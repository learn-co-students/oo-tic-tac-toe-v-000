class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")

  end
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 4, 6],
  [2, 5, 8],
  [3, 4, 5],
  [6, 7, 8]
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

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(location)
    @board[location] == "X" || @board[location] == "O"
  end

  def valid_move?(position)
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn_count
    count = 0
    @board.each do |player|
    if (player == "X" || player == "O")
      count += 1
    end
  end
   count
  end


  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      turn
    end
    move(index, current_player)
    display_board
  end

  def won?
    x  = false
    WIN_COMBINATIONS.each do |combo|
      #combo = [0, 1, 2] board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      #combo = [2, 4, 6]
      if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
        x = combo
      end
    end
    x
  end

  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end

  def draw?
    !won? && full?
  #   true
  #elsif won? == nil && !full? == true
  #  false
  #elsif won? == true
  #  false
  #end
  end

  def over?
  # binding.pry
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    x = nil
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
        x = @board[combo[0]]
        break
      end
    end
    x
  end

  def play
    until (over? == true)
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end
