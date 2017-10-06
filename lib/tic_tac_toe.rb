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
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end
  def move(input, token)
  @board[input] = token
end
def position_taken?(index)
  @board[index] != " " && @board[index] != "" && @board[index] != nil
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
  counter = 0
  @board.each do |turn|
      if turn == "X" || turn == "O"
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
  WIN_COMBINATIONS.each do |win_combos|
    if position_taken?(win_combos[0]) && @board[win_combos[0]] == @board[win_combos[1]] && @board[win_combos[1]] == @board[win_combos[2]]
      return win_combos
    else
    end
  end
  nil
end

def full?
  @board.all? do |positions|
    positions == "O" || positions == "X"
  end
end

def draw?
  full? && !won?
end

def over?
  draw? || full? || won?
end

def winner
  if won?
    @board[won?[0]]
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
