class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def move(location, current_player)
    @board[location.to_i-1] = current_player
  end

  def current_player
    turn_count % 2 == 0 ?  "X" : "O"
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

 def position_taken?(position) 
  !(@board[position].nil? || @board[position] == " ") 
end

def won?
  wincomb = []
  WIN_COMBINATIONS.each do |comb|
    (@board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X") || (@board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O") ?
    wincomb.push(true) : wincomb.push(false)
  end
  if wincomb.include?(true)
    WIN_COMBINATIONS[wincomb.index(true)]
  else
    false
  end
end

def full?
  @board.count("X") + @board.count("O") == 9 ?
  true : false
end

def draw?
  if won?
    false
  elsif !full?
    false
  else
    true
  end
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
    loc = won?[0]
    return @board[loc]
  else
    nil
  end
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
  else
    turn
  end
  display_board
end

def play
  until over? 
    turn
   end

  if winner != nil
    puts "Congratulations #{winner}!"
  else draw?
      puts "Cats Game!"
  end

end

end