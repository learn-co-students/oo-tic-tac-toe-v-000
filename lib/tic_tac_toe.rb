
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],
  [6,7,8],
  [2,4,6],
  [0,4,8],
  [1,4,7],
  [0,3,6],
  [2,5,8]]

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

def input_to_index(user_input)
user_input.to_i - 1
end

def move(position, char)
    @board[position] = char
  end


def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end


def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

def turn
  puts "Please enter 1-9:"
  user_input = gets.chomp
 index = input_to_index(user_input)
 if valid_move?(index)
     move(index, current_player)
     display_board
 else
     puts "Please enter 1-9:"
     user_input = gets.chomp
    index = input_to_index(user_input)
   end
 end


  def play
 turn =0
 until turn == 9
   puts turn
   turn += 1
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


 def won?
   WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
   position_1 = @board[win_index_1]
   position_2 = @board[win_index_2]
   position_3 = @board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
   end
 end
 nil
 end

 #full?
 def full?
   @board.each do |position|
     if position == " "
     return false
   else
      true
   end
 end
 end

 #draw?
 def draw?
   if full? && !won?
     true
   else
     return false
   end
end


 #over?
 def over?
   draw? || full? || won?
 end

 #winner?
 def winner
   win_combination = won?
   if win_combination
     @board[win_combination[0]]
   else
     nil
   end
end
end
