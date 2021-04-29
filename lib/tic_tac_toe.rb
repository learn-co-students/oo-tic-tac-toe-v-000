require 'pry'

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [6,4,2],
    [2,5,8],
    [1,4,7],
    [0,4,8]
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

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
  if @board[index] != ("X") && @board[index] != ("O")
    return false
  elsif @board[index] == ("X") || @board[index] == ("O")
    return true
  end
end

def valid_move?(index)
  if index.between?(0, 8) && !(position_taken?(index))
    return true
  else !index.between?(0, 8) || (position_taken?(index))
      return false
  end
end

def turn_count

  move_count = []
  @board.each do |token|
    counter = 0
    if token == "X" || token == "O"
      move_count.push(1)
    else
      counter += 1
    end
  end
  move_count.length.to_i
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
   puts "Please enter 1-9:"
   user_input= gets.chomp
   index = input_to_index(user_input)
   if valid_move?(index)== true
     move(index,current_player)
     display_board
   else
   until valid_move?(index)== true
       puts "Please enter 1-9:"
       user_input= gets.chomp
       index = input_to_index(user_input)
     end
   end
 end

 def won?

 empty_board = @board.all? {|location| location == " "}
 WIN_COMBINATIONS.detect do |sub_array|
  @board[sub_array[0]] == @board[sub_array[1]] && @board[sub_array[1]] == @board[sub_array[2]] && position_taken?(sub_array[0])

 end
 end

 def full?
  !@board.any? { |location| location == " " }
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if won?.nil?
    return nil
  end
  if @board[won?.first] == "X"
    return @board[won?.first]
  elsif @board[won?.first] == "O"
return @board[won?.first]

  end
end

def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
 end
 end
