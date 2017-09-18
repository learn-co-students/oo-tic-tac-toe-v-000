class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # First diagonal
    [2,4,6]  # Second diagonal
  ]

  # Define a method display_board that prints a 3x3 Tic Tac Toe Board
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

def move(user_input, character = "X")
  @board[user_input] = character
end

# code your #position_taken? method here!
def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end

end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index) == false
    turn
  end
  character = current_player
  move(index, character)
  display_board
end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?
  @board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?
  won? == false && full?

end

def over?
  won? || draw?
end

def winner
  if won?
    array = won?
    index1 = array[0]
    character = @board[index1]
    if character == "X"
      "X"
    elsif character == "O"
      "O"
    else
      false
    end
  else
    nil
  end
end

def play
  while over? == false
    turn
  end
  if draw?
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner}!"
  end
end

end
