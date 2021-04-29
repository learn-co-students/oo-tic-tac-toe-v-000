class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

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

def move(index, token)
 @board[index] = token
end

def position_taken? (index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
     false
  else
     true
end
end

def valid_move? (index)
if index.between?(0,8) && !position_taken?(index)
  true
else
  false
end
end

def turn
  puts "Please enter 1-9:"
 user_input = gets.strip
index = input_to_index(user_input)
until valid_move?(index) == true
  puts "please try a valid move. Use an empty location 1 through 9"
  user_input = gets.strip
 index = input_to_index(user_input)
end
move(index, current_player)
display_board
end

def turn_count
    count = 0
  @board.each do |player|
    if player == "X" || player == "O"
      count += 1
  end
end
  return count
end

def current_player
  if turn_count % 2 == 0
     "X"
  else
     "O"
  end
end

def won?
   WIN_COMBINATIONS.each do |win_combination|
     win = win_combination.all? do |index|
       @board[index] == "X"
     end
     if win
       return win_combination
     end
     win = win_combination.all? do |index|
       @board[index] == "O"
     end
     if win
       return win_combination
     end
   end
   return false
 end

def full?
  @board.none?{|token| token == " "}
end

def draw?
  full? && !won?
end

def over?
  won? || full? || draw?
end


def winner
 if !(won?)
   return nil
 elsif
  @board[won?[0]] == "X"
      "X"
   else
  @board[won?[0]] == "O"
     "O"
end
end

def play
    until over?
      turn
    end
    if won?

      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
