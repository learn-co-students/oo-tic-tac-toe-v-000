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
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
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
    num_of_turns = 0
    @board.each do |array|
      if array == "X" || array == "O"
      num_of_turns += 1
      end
    end
    num_of_turns
  end

  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_array|
      if @board[win_array[0]] == @board[win_array[1]] && @board[win_array[1]] == @board[win_array[2]] && position_taken?(win_array[0])
        win_array
      else
        false
      end
    end
  end

  def full?
    @board.all? do |board_index|
      board_index == "X" || board_index == "O"
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    if win_array = won?
    @board[win_array.first]
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
