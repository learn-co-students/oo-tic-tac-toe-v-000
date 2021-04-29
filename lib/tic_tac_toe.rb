class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
]

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

def input_to_index(input)
  index=input.to_i - 1
end

def move(index, current_player)
  @board[index]=current_player
end

def position_taken?(index)
  (@board[index] == "X" || @board[index] == "O")
end

def valid_move?(index)
  !(position_taken?(index)) && index.between?(0,8)
end

def turn
  puts "Please enter 1-9:"
  input=gets.strip
  index=input_to_index(input)
  player = current_player
    if valid_move?(index)
      move(index,player)
      display_board
    else turn
  end
end

def turn_count
  turn_counter = 0
  @board.each do |position|
    if position == "X" || position == "O"
      turn_counter += 1
    end
  end
  turn_counter
end

 def current_player
   turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.find { |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
(position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
}
end

def full?
  @board.include?("X" && "O") == true
  @board.include?(" ") == false
end

def draw?
  !won? && full?
end

def over?
  draw? || won? || full?
end

def winner
  if won?
    index = won?[0]
    @board[index]
  end
end

def play
  until over?
  turn
end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  else
    puts "Game Over."
  end
end

end