class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
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

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  if turn_count(board)%2 ==0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end

def won?
WIN_COMBINATIONS.each do |array|
    if array.all? { |value| @board[value] =="X" } || array.all? { |value| @board[value] =="O" }
      return array
    end
  end
  return false
end

def full?
  !@board.any? { |x| x == " " }
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

  def winner
  if winning_combo = won?
    @board[winning_combo.first]
  else
  end
end

def play
  until over? == true || won? != false
  puts 'turn'
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

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

end
