require 'pry'
class TicTacToe
  def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
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

  def move(input_to_index,player)
  @board[input_to_index] = player
  end


  def position_taken?(index)
  @board[index] != " " && @board[index] !="" && @board[index] != nil
  end

  def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
  end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index) 
    player = current_player
    move(index,player)
    display_board
  else
    puts "That move isn't valid."
    turn
  end
end

def turn_count
  moves = 0
  @board.each do |space|
    if space == "X" || space == "O"
    moves += 1
    end
  end
  moves
end

def current_player
  turn_count
  @player = ""
  moves = turn_count
  if moves.even? 
    @player = "X"
  else 
    @player = "O"
  end
  @player
end

def won?
    WIN_COMBINATIONS.each do |win_index|
      win_index_1 = win_index[0]
      win_index_2 = win_index[1]
      win_index_3 = win_index[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_index
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_index
        end
    end
     false
end

def full?
  @board.all? {|square| square != " "}
end

def draw?
  if full? && !won?
    return true
  elsif !won? && !full?
    return false
  elsif won?
    return false
  end
end

def over?
  if won? || draw? || full?
    return true
  end
end

def winner
  if won?
  binding.pry  
  winning_player = @board[(won?[0])]
  return winning_player
else
end
end

def play
  until over?
    turn
  end
  if won?
  winning_player=winner(@board)
    puts "Congratulations #{winning_player}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end


end
end
