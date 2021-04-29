class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [ #board[combo[0]]
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [6, 4, 2],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
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

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    char = current_player
    if valid_move?(index) == true
      move(index, char)
    else
      turn
    end
      display_board
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
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
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
    @board.none? do |token|
      token == " "
      # blank will equal either "X", "O", " "
      # how do we check if blank is equal to a empty space?
    end
  end

  def draw?
    if !won? && full?
      puts "Draw"
      true
    end
  end

  def over?
    if won? || full? || draw?
    true
    end
  end

  def winner
    if winning_combo = won?
    @board[winning_combo[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations " + winner + "!"
    else
      puts "Cat's Game!"
    end

  end

end
