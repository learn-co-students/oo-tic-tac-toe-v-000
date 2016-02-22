class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left col
  [1,4,7], # Middle col
  [2,5,8], # Right col
  [0,4,8], # Left diag
  [6,4,2] # Right diag
  ]

def move(position, token = "X")
  position = position.to_i - 1
  @board[position] = token
end

def position_taken?(position)
 if (@board[position] == " " || @board[position] == "" || nil)
   return false
 elsif (@board[position] == "X" || "O")
   return true
 end
end

def valid_move?(position)
 if (position_taken?(position.to_i - 1) == false) && (position.to_i.between?(1,9) == true)
   true
 else (position_taken?(position.to_i - 1) == true) || (position.to_i.between?(1,9) == false)
   false
 end
end

def turn
  puts "Please enter 1-9:"
  position=gets.strip
  if valid_move?(position) == true
    move(position, current_player)
  else
    turn
  end
end

def turn_count
    @board.count{|token| token == "X" || token == "O"}
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |combo|
    win_1 = combo[0]
    win_2 = combo[1]
    win_3 = combo[2]

    position_1 = @board[win_1]
    position_2 = @board[win_2]
    position_3 = @board[win_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
    return false
end

def full?
  @board.all? { |position| position == "X" || position == "O" }
end

def draw?
  if full? == true && won? == false
    true
  elsif won? == true
    false
  elsif full? == false
    false
  end
end

def over?
  if draw? == true
    true
  elsif won?
    true
  elsif full? == false
    false
  end
end

def winner
  if won?
    winning_array = won?
    if winning_array.any? { |i| @board[i] == "X" }
      return "X"
    elsif winning_array.any? { |i| @board[i] == "O" }
      return "O"
    end
  end
end

#def play
#  while over? == false
#    turn
#  end
#  if winner = "X"
#      puts "Congratulations X!"
#  end
#  if winner = "O"
#      puts "Congratulations O!"
#  end
#  if draw?
#    puts "Cats Game!"
#  end
#end

def play
  until over?
    display_board
    turn
  end

  if draw?
    puts "Cats Game!"
  else
    puts "Congratulations #{winner}!"
  end
end

end
