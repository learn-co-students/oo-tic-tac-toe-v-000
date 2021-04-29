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
   [2,4,6],
   [0,4,8]
   ]

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
      @index = input.to_i - 1
end

def move(index, token = "X")
@board[index] = token
  end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return false
  elsif @board[index] == "X" || @board[index] == "O"
      return true
  end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true
 else
    return false
end
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

def won?
  WIN_COMBINATIONS.detect do |win_combo|
   @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
    end
  end


def full?
  @board.all? {|full| full == "X" || full == "O"}
end

def draw?
  if !won? && full?
    return true
  elsif !won? && !full?
    return false
  else won?
    return false
  end
end

def over?
  if draw? || won? || full?
    return true
  end
end


def winner
  if player = won?
    @board[player[0]]
  end
end


def play
  #input = gets
  until over? #until the game is over...
    turn #players will keep taking turns
  end
  #plays the first few turns of the game
    if won? #if there's a winner...
      winner== "X" || winner == "O" #we check who the winner is...
        puts "Congratulations #{winner}!" #and congratulate them
    elsif draw? #if there's a draw, then print the below strings
      puts "Cat's Game!"
    end
end
end
