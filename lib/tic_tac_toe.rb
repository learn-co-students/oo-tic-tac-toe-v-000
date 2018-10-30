class TicTacToe
  def initialize
    board=Array.new(9, " ")
    @board=board
  end

  WIN_COMBINATIONS=[
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  index=user_input.to_i-1
  return index
end

def move(index, character="X")
  @board[index]=character
end

def position_taken?(index)
    if @board[index] ==" "
      return false
    else
      return true
    end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true
  else
    return false
  end
end

def turn
  puts "Please choose a square 1-9"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
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
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    position_1=@board[win_index_1]
    position_2=@board[win_index_2]
    position_3=@board[win_index_3]
    if position_1==position_2 && position_2==position_3 && position_1 !=" "
      return win_combination
    end
  end
  return false
end

def full?
  @board.each_with_index do |item, index|
    if position_taken?(index)==false
      return false
    end
  end
  return true
end

def draw?
  # if won?(board)==false && full?(board)==true
  #   return true
  # elsif won?(board)==false && full?(board)==false
  #   return false
  # elsif won?(board)==true
  #   return false
  # end
  won=won?
  full=full?
  if won==false && full==true
    return true
  elsif won==false && full==false
    return false
  elsif won==true
    return false
  else
    return false
  end
end

def over?
  draw?|| won?
end

def winner
  if won?
    z=@board[won?[0]]
    return z
  end
end

end
