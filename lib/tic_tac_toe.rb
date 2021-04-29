class TicTacToe
  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @user_input = user_input.to_i - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    @user_input = gets.strip
    @index = input_to_index(@user_input)
    if valid_move?(@index)
      move(@index, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |combos|
    @board[combos[0]] == @board[combos[1]] && @board[combos[1]] == @board[combos[2]] && position_taken?(combos[0])
    end
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won? != nil
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
