class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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
    index = input.to_i - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    taken = nil
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      taken = false
    else
      taken = true
    end
  end

  def valid_move?(index)
    valid = nil
    if index.between?(0, 8) == true && position_taken?(index) == false
      valid = true
    else
      valid = false
    end
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    character = nil
    if turn_count.even?
      character = "X"
    else turn_count.odd?
      character = "O"
    return character
   end
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
    WIN_COMBINATIONS.detect do |win_combination|

      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      (position_taken?(win_combination[0]) &&
      position_taken?(win_combination[1]) &&
      position_taken?(win_combination[2])) &&
      (position_1 == position_2 && position_2 == position_3)
    end
  end

  def full?
    @board.all? do |position|
    position == "X" || position == "O"
   end
  end

  def draw?
    !(won?) && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
    win_combination = []
    win_combination = won?
    return @board[win_combination[0]]
  else
    return nil
  end
end

def play
  display_board
until over?
    turn
    won?
    draw?
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat\'s Game!"
  end
end
end
