class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]

  ]

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
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

def input_to_index(userinput)
  num = userinput.to_i
  num = num -1
end

def move(index, char="X")
  @board[index] = char
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  elsif @board[index] == "X" or @board[index] == "O"
    true
  end
end

def valid_move?(index)
   if index < 0 || index > 8
     false
   elsif position_taken?(index)
     false
   else
     true
   end
end

def turn
  player = current_player
  puts "Please enter 1-9:"
  userinput = gets.strip
  index = input_to_index(userinput)
  if valid_move?(index)
    move(index, player)
    display_board()
  else
    turn()
  end
end

def turn_count
  count = 0
  @board.each do|turns|
    if turns == "X" || turns == "O"
      count += 1
    end
  end
  return count
end

def won?
  WIN_COMBINATIONS.find do |i|
    win_index1 = i[0]
  	win_index2 = i[1]
  	win_index3 = i[2]

  	pos_1 = @board[win_index1]
  	pos_2 = @board[win_index2]
  	pos_3 = @board[win_index3]

  	if pos_1 == "X" && pos_2 == "X" && pos_3 == "X" || pos_1 == "O" && pos_2 =="O" && pos_3 == "O"
      i
    end
  end
end

def full?
  if @board.include?(" ")
    false
  else
    true
  end
end

def draw?
  if won? == nil && full? == true
    true
  else
    false
  end
end

def over?
  if draw? || won?
    true
  end
end

def winner

  if test = won?
    win_index = test[0]
    if @board[win_index] == "X"
      "X"
    else
      "O"
    end
  else
    nil
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
  end
end










end
