#building an OO version of Tic Tac Toe!

#class definition
class TicTacToe

  #initialize instance variable @board
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

  # Define WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  #display the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  #execute a tic tac toe move
  def move(position, char = "X")
    @board[position.to_i - 1] = char
  end

  # Helper Method
  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end


#is the move valid?
  def valid_move?(position)
    pos = position.to_i

    if !pos.between?(1,9) || position_taken?(pos - 1)
      false
    else
      true
    end
  end


def won?
  WIN_COMBINATIONS.each do |combination|
    if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[0]] == @board[combination[2]]
      return combination
    end
  end
  false
end

def full?
    @board.all?{|position| position == "X" || position == "O"}
end


def draw?
  !won? && full?
end

def over?
  if draw? || won?
    true
    else
    false
  end

end

def winner
  if won?
  @board[won?[0]]
  end
end

#run a turn
def turn
  display_board
  puts "Please enter 1-9:"
  position = gets
  if !valid_move?(position)
    turn
    else

    move(position, current_player)
    display_board
  end
end


# how many turns have been played
def turn_count
  counter = 0
  @board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
   return counter
end



# current player
def current_player
  if turn_count % 2 == 0
    return "X"
    else
    return "O"
  end

end

def play
  until over?
    turn
  end
    if won?
      puts "Congratulations #{winner}!"

    elsif draw?
      puts "Cats Game!"
  end

end

def winner
  if won?
    @board[won?[0]]
    else nil
  end
end


end #end of class TicTacToe
