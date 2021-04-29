class TicTacToe
  def initialize
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
#display_board
#Define a method that prints the current board representation based on the `board` argument passed to the method.
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#input_to_index
def input_to_index(input)
  input.to_i
  input.to_i - 1
end

#move
def move(index, player)
  @board[index] = player
end

#position_taken?
def position_taken?(index)
  if @board[index] == "O"
  true
  elsif @board[index] == "X"
  true
  else  @board[index] == " " || "" || nil
  false
	 end
end

#valid_move
def valid_move?(index)
  if position_taken?(index) == false && index.between?(0, 8)
    true
  else
    false
	end
end

#turn
def turn
  puts "Please enter 1-9:"
  index=input_to_index(gets.strip)
  if valid_move?(index)
    current_player
    move(index, player = "X")
    display_board
  else
    turn
  end
end

#turn_count
def turn_count
  counter = 0
  @board.each do |board|
    if board == "X" || board == "O"
      counter+=1
      else
      counter += 0
    end
  end
  counter
end

#current_player
def current_player
  if turn_count % 2 == 0
      "X"
  else
      "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
  end
end

def full?
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?
  if  !won? && full?
      true
  else
    false
  end
end
#Build a method #over? that accepts a board and returns true if the board has been won, is a draw, or is full.

def over?
  if won?|| draw? #BE CAREFUL! If you flipped this, the test wouldn't have passed because it wouldn't stopped after the fail
    true
  end
end

#The #winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board.

def winner
  result = won?
  if result
    @board[result[0]]
  end
end

#play method

def play
  "Welcome to Tic Tac Toe!"
  until over?
    display_board
    "Where would you like to go?"
    input = gets.strip
    index = input_to_index(input)
    move(index, current_player)
  end
  if draw?
    puts "Cat's Game!"
  elsif
    winner == "X"
    puts "Congratulations X!"
  else winner == "O"
    puts "Congratulations O!"
  end
end
end
