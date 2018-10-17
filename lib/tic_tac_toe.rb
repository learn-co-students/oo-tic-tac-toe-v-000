class TicTacToe

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [2,4,6], # right diagonal
  [0,4,8] # left diagonal
]

  def initialize
    @board = Array.new(9, " ")

  end

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

def move(index, token = "X")
  @board[index] = token
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(index)
    taken = nil
    if (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
      taken = false
    else
      taken = true
    end
    taken
end


# code your #valid_move? method here
def valid_move?(index)
  move = nil
  if index.between?(0, 8) && !position_taken?(index)
    #do_something
    move = true
  else
    #do_something_else
    move = nil || move = false
  end
end

def turn
  puts "Please enter 1-9:"
  a_user_input = gets.strip
  index=input_to_index(a_user_input)
  if valid_move?(index)
     move(index, current_player)
     display_board
   else
     turn
 end
end

def turn_count
  # board.count{|token| token == "X" || token == "O"}

  turns = 0
    @board.each do |token|
      if token == "X" || token =="O"
        turns+=1
      end
  end
  turns
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

#def win?(board)
def won?
  # binding.pry
  WIN_COMBINATIONS.find do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
  end
end
#end # =>if lose -  false/nil
     # => return the winning combination (array) if there is a win.

#def full?(board)
def full?
  answer = true
  @board.each do |token|
    if token != "X" && token != "O"
      answer = false
    end
  end
	answer
    # other solution - board.all?{|token| token == "X" || token == "O"}
end
#end # => (true) if board is full with either x or an o
    # => (false) if board is not full - some blank spaces not filled with o's or x's \\ board.include?("")

def draw?
  full? && !won?
end # => (true) if the board has not been won but is full
     # => (false) if the board is not won and the board is not full, and false if the board is won.

def over?
  won? || draw? || full?
end # (true) if the board has been won, is a draw, or is full


def winner
if winning_combination = won?
@board[winning_combination[0]]
end
end # => the token, "X" or "O" - from the winning board




def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts 'Cat\'s Game!'
  else
    puts 'do something'
  end
end


end
