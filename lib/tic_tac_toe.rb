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

def play
  puts "Welcome to TicTacToe!"
  display_board
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

def move(location, character)
  @board[location.to_i-1]=character
end

def position_taken?(position)
      if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return false
  end
    true
end

def valid_move?(position)
  position = (position.to_i-1)
  if position.between?(0, 8) && position_taken?(position) == false
      true
    else
      false
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.chomp
  turn_count
  character = current_player

  if valid_move?(position)
    move(position, character)
  else
    turn
  end
  display_board
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

def won?
  win_combination = WIN_COMBINATIONS.detect do |win|
    win.all? {|i| @board[i]=="X"} || win.all? {|i| @board[i]=="O"}
  end
    win_combination unless win_combination == nil
end

def full?
  @board.all?{|i| i == "X" || i == "O"}
end

def draw?
  full? && !won?
end

def over?
  draw? || won?
end

def winner
  if wins = won?
    @board[wins[0]]
  end
end


end

