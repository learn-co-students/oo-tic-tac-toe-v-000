class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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

  def move(position, player)
    @board[position] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(user_index)
    user_index.between?(0,8) && !position_taken?(user_index)
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter your move: 1 - 9"
      user_input = gets.strip
      user_index = input_to_index(user_input)
  if valid_move?(user_index)
      move(user_index, current_player)
    display_board
  else
      turn
    end
  end

  def won?
  WIN_COMBINATIONS.detect do |win_combination|
      location1 = win_combination[0]
      location2 = win_combination[1]
      location3 = win_combination[2]
      @board[location1] == @board[location2] && @board[location2] == @board[location3] && @board[location1] != " "
    end
  end

  def full?
    @board.none? {|space| space == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    win_combination = won?
  if win_combination
    win_location = win_combination[0]
    @board[win_location]
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
