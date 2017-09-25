

# class House #blueprint for all houses
#   def initialize
#       @material = 'brick'
#   end
#   def material
#     @material
#   end
#
#   def material=(material)
#     @material = material
#   end
#
#   def clean_house
#     # cleaning house1
#     material=
#   end
#
#   def sold?
#     false
#   end
# end
#
# house1 = House.new
# house2 = House.new
# house1.material #=>'Brick'
# house2.material #=>'Brick'
# house2.material = "wood"
# house2.material #=>'wood'

class TicTacToe
  def initialize (board= [" "," "," "," "," "," "," "," "," "])  #default(board=array)
    @board = board
    another_board = []
    puts another_board
  end

  def board=(board)
    puts another_board
    @board = board
  end

  def board
    @board
  end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

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


def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)  #current_player is not set to "X" will be either X or O.
    display_board
  else
    turn
  end
end

def turn_count #counts occupied positions

counter= 0
@board.each do |element|
  if element== "X" || element== "O" #if_my_condition_is_met
 counter +=1
 end
end
counter  #after .each do returns array, i need to put counter to get a number
end

 def current_player
   if turn_count % 2 == 0
     "X"                                  #"puts" method will return nil
   else
      "O"
  end
 end

 def move(index, current_player)
   @board[index] = current_player
 end



 def won?
     WIN_COMBINATIONS.each do |win_combination|

   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = board[win_index_1] # load the value of the board at win_index_1
   position_2 = board[win_index_2] # load the value of the board at win_index_2
   position_3 = board[win_index_3] # load the value of the board at win_index_3
 if position_1 == "X" && position_2 == "X" && position_3 == "X" ||position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination
   end
 end
 else
   return false
 end


 def full?
   board.all? do |element|
      element == "X" || element == "O"
     end
   end

 def draw?
   !won? && full?
 end

    def over?
      won? || draw?
    end

 def winner
   if won?
      @board[won?[0]]
   end
 end

 def play
   until over?
    turn
  end

  if winner
    puts "Congratulations #{winner}!"
  else
     puts "Cat's Game!"
  end
  end
end
