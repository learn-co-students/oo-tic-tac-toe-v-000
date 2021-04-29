class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  def display_board
    puts " #{@board[0]} ""|"" #{@board[1]} ""|"" #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} ""|"" #{@board[4]} ""|"" #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} ""|"" #{@board[7]} ""|"" #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index] == nil || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      character = current_player
      move(index, character)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |i|
        @board[i[0]] == @board[i[1]] &&
        @board[i[1]] == @board[i[2]] &&
        position_taken?(i[1])
    end
  end

  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
    @board[won?[0]]
    else
      nil
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
