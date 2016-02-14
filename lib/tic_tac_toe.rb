class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end 

def move(position, value = current_player)
  position = position.to_i-1 
  @board[position] = value
end 

def position_taken?(position)
  @board[position] == "X" || @board[position] == "O"
end

def valid_move?(position)
  position = position.to_i-1 
  !position_taken?(position) && position.between?(0,8)
end 

def turn
  puts "Please put a number 1 - 9:"
  input = gets.strip
  if valid_move?(input)
    move(input)
    display_board
else turn
end 
end 

def turn_count
  count = 0
  @board.each do |x| 
    if x == "X" || x=="O"
    count +=1 
  end 
end 
  count
end 

def current_player
  if turn_count % 2 == 0 
    return "X"
  else 
    return "O"
  end
end 

def won?
  WIN_COMBINATIONS.detect {|x| 
    @board[x[0]] == @board[x[1]] && @board[x[1]] == @board[x[2]] &&
    position_taken?(x[0]) }
end 

def full?
  @board.all? { |x| x=="X" || x=="O" }
end 

def draw?
  if !won? && full? 
    true
  elsif !won? && !full?
    false
  elsif won?
    false
  end
end

def over?
  draw? || won? || full?
end

def winner
  if token = won?
  @board[token.first]
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

end 