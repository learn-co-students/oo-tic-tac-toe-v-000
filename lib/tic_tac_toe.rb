class TicTacToe
def initialize (board = nil)

  @board = board || Array.new(9, " ")
   end
 WIN_COMBINATIONS =  [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
]
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


#input_to_index
def input_to_index(user_input)
  @user_input = user_input
  user_input.to_i - 1
end

#move
def move(index, player = "X")
  @board[index] = player
#  @index = index
end

def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
#current_player
def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

#turn
def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(index)
    token = current_player
    move(index, token)

  else
    turn
  end
  display_board
end

#turn_count
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

#won?
def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

#full?
def full?
  @board.all?{|token| token == "X" || token == "O"}
end

#draw?
def draw?
  !won? && full?
end

def over?
    won? || draw?
end
#winner
#Given a winning @board, the #winner method should return the token,
# "X" or "O", that has won the game.
def winner
    if combo = won?
      @board[combo[0]]
    end
  end


#PLAY
  #if the game was won
  #  congratulate the winner
  #else if the game was a draw
    #tell the players it ended in a draw

def play
  turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
