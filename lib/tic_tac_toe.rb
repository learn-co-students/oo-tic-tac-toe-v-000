# this class is the blueprint for each game, defining objects and behaviors
class TicTacToe

#every instance of this class will begin with its own board array instance variable of 9 spaces of empty strings
  def initialize()
    @board = Array.new(9, " ")
  end

#this constant declares combinations of indexes that produce a winner
  WIN_COMBINATIONS = [
  [0,1,2], #row-wins
  [3,4,5],
  [6,7,8],

  [0,3,6], #column-wins
  [1,4,7],
  [2,5,8],

  [0,4,8], #diagonal-wins
  [2,4,6]
  ]

#method uses strings and interpolation of the board array variable to create a visual ASCII game board
def display_board()
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
  @board[index.to_i] == "X" || @board[index.to_i] == "O"
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
end

def turn_count()
  @board.count { |spot| spot == "X" || spot == "O" }
end

def current_player()
 turn_count.even? ? "X" : "O"
end

def turn()
  puts "Please, choose a position ( 1 - 9 ) : "
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?()
  WIN_COMBINATIONS.each do |win|
      if position_taken?(@board[win[0]]) && @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]]
        return win
      end
  end
  return false
end

def full?()
  @board.all? { |space| space == "X" || space == "O" }
end

def draw?()
  full?() && !won?()
end

def over?()
 draw?() || won?()
end

#there must be a different way to write this method
#i'm pretty sure what I wrote is a jerk-way of writing it
#so I feel like I'm the real reason why this method would
#return a " " instead of nil is something wth OO vs procedural
def winner()
  if won?()
    win = won?()
      if @board[win[0]] == "X"
        return "X"
      elsif @board[win[0]] == "O"
        return "O"
      else @board[win[0]] != "X" && @board[win[0]] != "O" #srsly..this is like ducttape over a huge hole
        return nil
      end
  end
end


def play()
  until over?()
    turn()
    draw?()
  end
  if !won?() && !draw?() && !over?()
      play()
    elsif won?() && over?()
      puts "Congratulations #{winner().to_s}!"
    else draw?()
      puts "Cat's Game!"
  end
end


end
