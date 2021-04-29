class TicTacToe

  def initialize
    @board = Array.new(9," ")
  end

WIN_COMBINATIONS = [
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

def move (location, current_player = "X")
  @board[location.to_i-1] = current_player
end

def position_taken?(position)
  if @board[position] == "" || @board[position] == " " || @board[position] == nil
    return false
  else 
    return true
  end
end

def valid_move?(position)
  position = position.to_i - 1
  if position.between?(0, 8) && !(position_taken?(position))
    return true
  else
    return false
  end
end

def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position) == true
      move(position, current_player)
    else
      puts "Plase enter 1-9:"
      position = gets.strip
      move(position, current_player)
    end
    display_board
  end 

def turn_count
  turn_count = 0
  @board.each do |value|
    if value != " "
      turn_count += 1
    end
  end
  return turn_count
end 

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

def won?
  WIN_COMBINATIONS.each do |combo|
    if (combo.all? {|index| @board[index] == "X"}) || (combo.all? {|index| @board[index] == "O"})
      return combo
    end
  end
  return false
end 

def full?
  @board.each.all? {|value| value == "X" || value == "O"}
end

def draw?
  !won? && full? 
end

def over?
  full? || won? || draw?
end

def winner
  return @board[won?.first] if won?
end

def play
  display_board
  until over?
     turn
  end
  if won?
    puts "Congratulations #{winner}!"

  else draw?
    puts "Cats Game!"
  end
end
end

