class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left to right diagonal
    [6,4,2], # Right to left diagonal
  ]
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i
    user_input-=1
    @index = user_input
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

   def turn_count
      @board.count{|token| token == "X" || token == "O"}
   end

   def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def turn
     puts "Please enter 1-9:"
     @user_input = gets.strip
     @index = input_to_index(@user_input)
     if valid_move?(@index) == true
       move(@index, current_player)
     else turn
     end
     display_board
   end

#passing
 def won?
   WIN_COMBINATIONS.each do |win_combination|
     pos_1 = @board[win_combination[0]]
     pos_2 = @board[win_combination[1]]
     pos_3 = @board[win_combination[2]]
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return win_combination
    end
    end
    return false
 end

#passing
 def full?
   if @board.detect {|i| i == " " || i == nil}
     return false
   else
     return true
   end
 end

#passing
 def draw?
   if won? == false && full? == true
     return true
 else false
 end
 end

 def over?
   if draw? || won?
     return true
   else
     return false
   end
 end

 def winner
   if winning = won?
   #return first item in the win_combination array
   return @board[winning.first]
 end
 end

def play
  until over? == true
    turn
  end

  if won? != false
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end
end
