class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
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
  def input_to_index(input)
    input.to_i - 1
  end
  def move(input, char)
    @board[input] = char
  end
  def position_taken?(input)
    if @board[input] == "X" || @board[input] == "O"
      true
    else
      false
    end
  end
  def valid_move?(input)
    if (input >= 0 && input <= 8) && position_taken?(input) == false
      true
    end
  end
  def turn_count
    i = 0
    @board.each do |index|
      if index == "X" || index == "O"
        i += 1
      end
    end
    i
  end
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  def turn
    puts "#{current_player}'s turn! Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.detect do |key|
      @board[key[0]] == @board[key[1]] &&
      @board[key[1]] == @board[key[2]] &&
      position_taken?(key[0])
    end
  end
  def full?
    @board.all? do |contents|
      contents == "X" || contents == "O"
    end
  end
  def draw?
    !won? && full?
  end
  def over?
    draw? || won?
  end
  def winner
    if win_combo = won?
      @board[win_combo.first]
    end
  end
  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
