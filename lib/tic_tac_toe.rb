class TicTacToe
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def initialize (board = nil)
  @board = board || Array.new(9, " ")
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

  def move(input_to_index, character)
    @board[input_to_index] = character
  end

  def position_taken?(index)
  if @board[index]== "X" || @board[index] == "O"
    true
  else
    false
  end
  end

  def valid_move?(index)
  if !position_taken?(index) && index.between?(0, 8)
    return true
  else
  return false
  end
  end

  def turn
    @board
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
   display_board()
  else
    puts "Sorry, that was incorrect, please enter 1-9:"
  turn()
  end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
turn_count % 2 == 0 ? "X" : "O"
  end


# part two working on the won instance method

 def won?
WIN_COMBINATIONS.detect do |win_combination|
 @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
   end
end

def full?
@board.all? { |index| index == "X" || index == "O"}
end


def draw?
if !won? && full? == true
  return true
else
  return false
end
end

def over?
if won?
  return true
elsif draw?
  return true
else
  return false
end
end

def winner
 if win = won?
   return  @board[win[0]]
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
 end
