class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " -----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " -----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
    if valid_move?(index) == true
      move(index, token)
    else
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.find do |array|
      @board[array[0]] == @board[array[1]] && @board[array[1]] == @board[array[2]] && position_taken?(array[0])
    end
  end

  def full?
    @board.all? do |square|
      square == "X" || square == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo[0]]
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
