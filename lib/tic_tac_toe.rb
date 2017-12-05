# Helper Methods
#translating the procedural ruby tictactoe game to OO tictactoe
class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #middle_row_win
    [6,7,8], #bottom_row_win
    [0,3,6], #first_column_win
    [1,4,7], #second_column_win
    [2,5,8], #last_column_win
    [0,4,8], #down_diagonal_win
    [2,4,6] #up_diagonal_win
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


  def move(index, token = "X")
    @board[index] = token
  end


  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      taken = false
    else
      taken = true
      end
  end
  #more eloquent way but less comprehensive is the following:
  # def position_taken(index)
  #  @board[index] != " "
  # end


  def valid_move?(index)
    (position_taken?(index) == false && index.between?(0,8))
  end

  #or
  #def valid_move?(index)
  #!position_taken(index) && index.between? (0,8)
  #end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end


def turn_count
  @board.count {|token| token == "X" || token == "O"}
end
#for each position in board array, count if token is equal to X or equal to O.
#return value is integer of count

  def current_player
     if turn_count % 2 == 0
     "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[1]] == @board[win_combo[2]] &&
      position_taken?(win_combo[0])
    end
  end

  #could also use any? and explicitly return win_combo since the implicit
  #return is true or false. in this case I prefer detect since it's implicit
  #return value is what we are looking for anyways.
# def won?
#    WIN_COMBINATIONS.any? do |combo|
#      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
#        return combo
#      end
#    end
#  end


  def full?
    @board.all? {|value| value == "X" || value == "O"}
  end

  #or
  #def full?
  #  @board.all?{|square| square != " " }
  #end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      @board[win_combo.first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
#or
#def play
#    turn until over?
#    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#  end
#end


end
=begin
#everything below here is the procedural version of the helper methods.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top_row_win
  [3,4,5], #middle_row_win
  [6,7,8], #bottom_row_win
  [0,3,6], #first_column_win
  [1,4,7], #second_column_win
  [2,5,8], #last_column_win
  [0,4,8], #down_diagonal_win
  [2,4,6] #up_diagonal_win
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end


def move(board, index, character)
  board[index] = character
end


def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    taken = false
  else
    taken = true
    end
end


def valid_move?(board,index)
  if (position_taken?(board, index)==false && index.between?(0,8))
    then true
  end
end

#order doesn't matter in methods. it reads every method at once
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  character = current_player(board)
  if valid_move?(board, index)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  num_turns = 0
  board.each do |turns|
      if turns == "X" || turns =="O"
        num_turns += 1
        end
    end
    num_turns

end


def current_player(board)
  num_turns = turn_count(board)
 if num_turns % 2 == 0
   "X"
  else
    "O"
  end
end
#detect returns the first for which the block is true
#ALL of the following conditions must be true
# 1. value at board position [winning index 0] == the same at board[winning index 1]
#2. value at board position [winning index 1] == the same at board[winning index 2]
# the position at the first winning index IS taken (NOT EMPTY)

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end

def full?(board)
  board.all? {|value| value == "X" || value == "O"}
end


#the formal solution relies only on a single comparative line of logic
def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 elsif draw?(board)
   puts "Cat's Game!"
 end

end
=end
