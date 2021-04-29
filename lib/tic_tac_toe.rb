class TicTacToe
   def initialize
     @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

 WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8],
   [0, 4, 8],
   [2, 4, 6],
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

   def move(index, current_player)
     @board[index] = current_player
   end

   def position_taken?(index)
    if @board[index] == " "  ||  @board[index] == "" || @board[index] == nil
       taken = false
     else
       taken = true
     end
   end

   def valid_move?(index)
     if index.between?(0,8)  &&  !position_taken?(index)
       true
     else
       taken = false
     end
   end

   def turn
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index)
       move(index, current_player)
       display_board
     else
       turn
     end
   end
   def turn_count

     counter = 0
     @board.each do |count|
       if count == "X" || count == "O"
       counter += 1
       end
     end
     counter
   end

   def current_player
     if turn_count.even?
       "X"
     else
       "O"
     end
   end

   def won?
     WIN_COMBINATIONS.each do |win_combo|
       index_1 = @board[win_combo[0]]
       index_2 = @board[win_combo[1]]
       index_3 = @board[win_combo[2]]

       if index_1 == "X" && index_2 == "X" && index_3 =="X"
         return win_combo
       elsif index_1 == "O" && index_2 == "O" && index_3 =="O"
         return win_combo
       end
     end
     false
   end

   def full?
     @board.all? do |index|
     index == "X" || index == "O"
    end
   end

   def draw?
     if full? && !won?
       true
     end
   end

   def over?
     if won? || draw?
       true
     end
   end

   def winner
     win_combo = won?
     if win_combo == false
       return nil
     elsif @board[win_combo[0]] == "X"
       return "X"
     else @board[win_combo[0]] == "O"
       return "O"
     end
   end

   def play
      while !over?
         turn
       end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw?
        puts "Cat\'s Game!"
     end
   end

end
