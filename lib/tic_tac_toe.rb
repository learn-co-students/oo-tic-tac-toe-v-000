class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
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
  
  WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [2,4,6]  #Right start diagonal
]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(position, char = "X")
   @board[position] = char
end

def position_taken?(position)
  @board[position] != " " && @board[position] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]
    position_1 = @board[index_1]
    position_2 = @board[index_2]
    position_3 = @board[index_3]
    position_1 == position_2 && position_2 == position_3 && position_1 != " "
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


def play
  until over?
    puts "Your Turn"
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  else
    return nil
  end
end


def turn_count
  counter = 0
  @board.each do |token| 
    if token == "X" || token == "O"
      counter += 1 
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def position_taken?(index)
!(@board[index].nil? || @board[index] == " ")
 end
 
 def full?
  !@board.any? { |x| x == " " }
 end

def draw?
   full? && !won?
end

def over?
  won? || draw?
end  

def winner
  if winning_combo = won?
    @board[winning_combo[0]]
  end
end


end