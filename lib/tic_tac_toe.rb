class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
[0, 1, 2], [3, 4, 5],
[6, 7, 8], [0, 4, 8],
[2, 4, 6], [0, 3, 6],
[1, 4, 7], [2, 5, 8],
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(input, character = "X")
  @board[input] = character
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else @board[index] == "X" || @board[index] == "O"
    true
  end
end

def valid_move?(index)
   if index.between?(0, 8) && !position_taken?(index) == true
     true
   else
     false
 end
end

def turn
  puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
if valid_move?(index)
 move(index, current_player)
 print display_board
else
 turn
  end
end

def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player
if turn_count.even?
  "X"
else
  "O"
  end
end

def won?
WIN_COMBINATIONS.each do |win_index|
   if @board[win_index[0]] == "X" && @board[win_index[1]] == "X" && @board[win_index[2]] == "X"
      return win_index.to_ary
    elsif @board[win_index[0]] == "O" && @board[win_index[1]] == "O" && @board[win_index[2]] == "O"
      return win_index.to_ary
    end
end
    false
end

def full?
  @board.none? { |space|
if space == " "
true
else
  false
end
}
  end

def draw?
  if won? == false && full? == true
    true
  else
    false
  end
end

def over?
  if won? && full?
    true
  elsif won? && !full?
    true
  elsif draw? == true
    true
  else
    false
  end
end

def winner
  if won? == false
   nil
 else
  won?.each do |indexes|
    if @board[indexes] == "X"
      return  "X"
    elsif @board[indexes] == "O"
       return "O"
      end
     end
   end
end

def play
until over?
  turn
   end

   if  winner == "X" && winner != "O"
     puts "Congratulations X!"
   elsif winner == "O"
     puts "Congratulations O!"
   elsif draw?
     puts "Cat's Game!"
   end

end
end
