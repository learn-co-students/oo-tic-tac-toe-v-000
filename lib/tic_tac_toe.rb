class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def input_to_index(input)
  index = input.to_i - 1
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(index)
    if (!position_taken?(index) && index.between?(0, 8))
    true
    end
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

  def move(index, token)
    @board[index] = token
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = current_player
  if valid_move?(index)
    move(index, token)
  else
    turn
  end
  display_board
  end

  def turn_count
  count = 0
  @board.each do |token|
    if token == "X" || token == "O"
      count += 1
    end
  end
  return count
  end

  def current_player
  t = turn_count
  if t % 2 == 0
    return "X"
  else return "O"
  end
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

  def won?
  WIN_COMBINATIONS.detect do |winc|
    @board[winc[0]] == @board[winc[1]] &&
    @board[winc[1]] == @board[winc[2]] &&
    position_taken?(winc[0])
  end
  end

  def full?
  @board.all? do |token|
    token == "X" || token == "O"
  end
  end

  def draw?
  !won? && full?
  end

  def over?
  won? || draw?
  end

  def winner
  if winc = won?
    @board[winc.first]
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
