class TicTacToe
  WIN_COMBINATIONS = [

      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]
  def initialize(board = nil)
    @board = board || @board = Array.new(9, " ")
end
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def input_to_index(user_input)# code your input_to_index and move method here!
user_input = user_input.to_i - 1
end
def move(index, value = "X")
  @board[index] = value
end
def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end
def valid_move?(index)# code your #valid_move? method here
if position_taken?(index)
  false
elsif index.between?(0, 8)
  true
end
end
def turn_count
counter = 0
@board.each do |boards|
  if boards == "X" || boards == "O"
counter += 1
end
end
counter
end
def current_player
if turn_count.even?
  "X"
else
  "O"
end
end
def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index("#{user_input}")
  if valid_move?(index)
    value = current_player
    move(index, value)
    display_board
  else
    turn
end
end
def won?
WIN_COMBINATIONS.each do |value|
  num1 = @board[value[0]]
  num2 = @board[value[1]]
  num3 = @board[value[2]]
if num1 == "X" && num2 == "X" && num3 == "X" || num1 == "O" && num2 == "O" && num3 == "O"
return value
end
end
return false
end
def full?
  @board.all? do |taken|
  taken == "X" || taken == "O"
    end
end
def draw?
  if !won? && full?
    true
  end
end
def over?
  if draw? || won?
    true
  end
end
def winner
  won = won?
  if won
    @board[won[0]]
  else nil
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
