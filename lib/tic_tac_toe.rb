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
puts " #{@board [0]} | #{@board [1]} | #{@board [2]} "
puts "-----------"
puts " #{@board [3]} | #{@board [4]} | #{@board [5]} "
puts "-----------"
puts " #{@board [6]} | #{@board [7]} | #{@board [8]} "
end

def move (index, token)
  index= index.to_i - 1
  @board[index] =token
end

def position_taken?(index)
!(@board[index].nil? || @board[index] == " " || @board[index] == "")
end

def valid_move?(index)
    index.to_i.between?(1, 9) && !position_taken?(index.to_i - 1)
end

def turn
  puts "Please enter 1-9:"
    input = gets.strip
    token = current_player
  if valid_move?(input)
    token= current_player
    move(input, token)
    display_board
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
WIN_COMBINATIONS.each do |win_index|
  position_1= @board[win_index[0]]
  position_2= @board[win_index[1]]
  position_3= @board[win_index[2]]

if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_index
end
end
false
end

def full?
@board.none? {|board_space| board_space == " "}
end

def draw?
  !won? && full?
end

def over?
   draw? || won?
end

def winner
  if winning_array = won?
    @board[winning_array [0]]
 end
end

def play
  until over?
    turn
end

  if winner
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
 end

end
