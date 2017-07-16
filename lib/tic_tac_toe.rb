class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row horizontal, WIN_COMBINATIONS[0] IN OTHER WORDS THIS IS THE SAME AS COMBO[0]
    [3,4,5], #middle row horizontal COMBO[0] == 3
    [6,7,8], #bottom row horizontal
    [0,3,6], #left-side vertical
    [1,4,7], #middle vertical
    [2,5,8], #right-side vertical
    [2,4,6], #diagonal win 1
    [0,4,8], #diagonal win 2
  ]

  def display_board
      puts " #{@board [0]} | #{@board [1]} | #{@board [2]} "
      puts "-----------"
      puts " #{@board [3]} | #{@board [4]} | #{@board [5]} "
      puts "-----------"
      puts " #{@board [6]} | #{@board [7]} | #{@board [8]} "
  end

  def input_to_index(input)
    board_position = input.to_i - 1
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      return true
    end
  end

  def turn_count
    counter = 0
    @board.each do |move|
      if move == "X" || move == "O"
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

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        true
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        true
      else
        false
      end
    end
  end

  def full?
    @board.none? do |check|
      if check == " "
      true
      end
    end
  end

  def draw? #This will return true if the board is full and there is no win
    full? && !won?
  end

  def over?
    if won? || draw? || full?
      true
    end
  end

  def winner
    @board[won?[0]] if won?
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
