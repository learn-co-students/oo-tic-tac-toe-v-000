class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row win
    [3, 4, 5], #Middle row win
    [6, 7, 8], #Bottom row win
    [0, 3, 6], #left column win
    [1, 4, 7], #middle column win
    [2, 5, 8], #right column win
    [0, 4, 8], #left diagonal win
    [2, 4, 6] #right diagonal win
  ]

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end
  
   def input_to_index(input)
      @input = input.to_i
      @input = @input -1
   end

   def move( index, character)
     @board[index] = character   
   end

   def position_taken?(index)
     @index = @board[index]
     if @index == " " || @index == ""
        return false
     else
         return true
     end
   end   

   def valid_move?(index)
     @index = index
     if @index.between?(0, 8) && !position_taken?(index)
       return true
     else
       return false
     end
   end     
       
   def turn_count
       i = 0
       @board.each do |token|
         if token == "X" || token == "O"
           i += 1
         end # if
       end # each
       return i
   end # method turn_count

   def current_player
     if turn_count.even? == true
       return "X"
     else
       return "O"
     end #if
   end

   def turn
     puts "Please enter 1-9:"
     user_input = gets
     input_to_index = input_to_index(user_input)

     if valid_move?(input_to_index)
       move(input_to_index, current_player)
       display_board
     else
       turn
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

         if position_1 == "X" && position_2 == "X" && position_3 == "X"  || position_1 == "O" && position_2 == "O" && position_3 == "O"
             return win_combination
         end #if
         end #each
           return false
   end #won

   def full?
      @board.all?{|token| token == "X" || token == "O"}
   end

   def draw?     
    if  full? && !(won?)
        return true
    elsif won?
      return false
    end
   end

   def over?
      won? || draw?
   end

   def winner
     if winning_combo = won?
       @board[winning_combo.first]
     end
   end

   def play
       until over?
           turn
       end
       if draw?
         puts "Cat's Game!"
       else
         winning_player = winner
         puts "Congratulations #{winning_player}!"
       end
   end
end

  