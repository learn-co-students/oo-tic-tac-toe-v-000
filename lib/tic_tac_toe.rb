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
  [2,4,6]
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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    #display_board
    move(index, current_player)
    else
      turn
    end
    display_board
end

def turn_count
  count = 0
  @board.each do |i|
    if i != " "
      count += 1
    end
  end
    count
 end

 def current_player
    turn_count.even? ? "X" : "O"
 end

def won?
  WIN_COMBINATIONS.find do |win|
  if win.all?{|y| @board[y] == "X"}
    return win
  elsif win.all?{|y| @board[y] == "O"}
      return win
    end
  end
  return false
end

def full?
  @board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?
  if !won? == true && full? == true
    return true
  end
end

def over?
  if won? == true || draw? == true || full? == true
    return true
  else
    return false
  end
end


def winner
  if draw? || !full? && !won?
    return nil
  elsif @board[won?[0]]== "X"
    return "X"
  elsif @board[won?[0]]== "O"
    return "O"
  end
end


def play
  until over? == true || won? != false
    turn
  end
  if draw? == true
       puts "Cat's Game!"
  elsif won?
     puts "Congratulations #{winner}!"
   else
     return nil
   end
end
end
