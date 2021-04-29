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
 [6,4,2],
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
   @board[index] == "X" || @board[index] == "O" 
end
 
 def valid_move?(index)
   index.between?(0, 8) && !position_taken?(index)
    
end

def turn
   puts "Please enter 1-9"
  user_input = gets.strip
  index = input_to_index(user_input)
 
 if valid_move?(index) 
   token = current_player
  move(index, token)
  display_board
  else 
  puts "That's not a valid move!"
  turn
 end
end
   
def turn_count
     @board.count do |position|
       position != " "
  end
end
 
 def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end
 
 def won?
       WIN_COMBINATIONS.detect do |win_combo|
         postion_1 = @board[win_combo[0]]
         postion_2 = @board[win_combo[1]]
         postion_3 = @board[win_combo[2]]
      
       postion_1 == "X" && postion_2 == "X" && postion_3 == "X" ||
       postion_1 == "O" && postion_2 == "O" && postion_3 == "O"
  end
end
    
def full?
      @board.all? do |position|
      position == "X" || position == "O"
    end
  end
  
def draw?
    !won? && full?
end

def over?
  won? || draw?
end

def winner
  won? && @board[won?[0]]
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