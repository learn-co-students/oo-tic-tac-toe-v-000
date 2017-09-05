class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, char = "X")
    @board[position] = char
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each { |turn_input| counter += 1 if turn_input == "X" or turn_input == "O" }
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
    @board.all? { |character| character == "X" || character == "O" }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if winning = won?
      @board[winning.first]
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
