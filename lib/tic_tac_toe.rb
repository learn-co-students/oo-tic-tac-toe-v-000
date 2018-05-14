class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

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
  
def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, player_token = "X")
  board[index] = player_token
end

def position_taken?(index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  player_token = current_player
  if valid_move?(index)
    move(index, player_token)
    display_board
  else turn
  end
end

def turn_count
  counter = 0
board.each do |turn|
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
   pos1 = board[win_index[0]]
   pos2 = board[win_index[1]]
   pos3 = board[win_index[2]]
   
   if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
    return  win_index
end
end
else false
end

def full?
  board.all? do |index|
   index == "X" || index == "O"
    end
  end

def draw?
 full? && !(won?)
    end

def over?
  draw? || won?
end

def winner
  if won?
  return board[won?[0]]
end
end

def play
  until over?
    turn
   end
   if won?
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
end

end