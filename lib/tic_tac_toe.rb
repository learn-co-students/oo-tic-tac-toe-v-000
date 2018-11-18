class TicTacToe
  def initialize
      @board = Array.new(9, " ")
  end 
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
def input_to_index(user_input)
  user_input.to_i-1
end
def move(index_number, token="X")
   @board[index_number]=token 
end
def position_taken?(index_number)
  @board[index_number]!=" " && @board[index_number]!="" && @board[index_number]!=nil
end
def valid_move?(index_number)
  if position_taken?(index_number) == false && index_number.between?(0, 8)
      true
  end
end
def turn
  puts "Please enter 1-9:"
  user_input=gets.strip
  index_number=input_to_index(user_input)
  if valid_move?(index_number)
    token = current_player
    move(index_number, token)
    display_board
  else
    turn
  end
end
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end 
def current_player
  if turn_count % 2 == 0
    return "X"
  elsif turn_count % 2 != 0
    return "O"
  end 
end
def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board[win_combination[0]]== @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
  end 
end
def full?
  !@board.any? {|x| x == " "}
end 
def draw?
 !won? && full?
end
def over?
  if won? || full? || draw?
    return true
  else
    return false
  end
end 
def winner
  if won?
    winner = won?
    @board[winner[0]]
  end 
end 
def play
  until over? == true 
    turn
  end
  if won? 
    puts "Congratulations #{winner}!"
  else
    draw? 
    puts "Cat's Game!"
  end 
end 
end 