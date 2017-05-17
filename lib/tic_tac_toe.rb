class TicTacToe
  def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

   WIN_COMBINATIONS = [
     [0,1,2], #top row
     [3,4,5], #middle row
     [6,7,8], #bottom row
     [0,3,6], #first column
     [1,4,7], #middle column
     [2,5,8], #bottom column
     [0,4,8], #first diagonal
     [6,4,2]  #second diagonal
   ]

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(user_input)
    index = user_input.to_i - 1
   end

   def move(index, token = "X")
     @board[index] = token
     #display_board
   end

   def position_taken?(index)
     if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
       return false
     elsif (@board[index] == "X") || (@board[index] == "O")
       return true
     end
   end

   def valid_move?(index)
     if position_taken?(index)
       return false
     elsif index.between?(0,8)
       return true
     end
   end

   def turn_count
     turn = 0
     @board.each do |space|
       #if the space on the board, is an X or an O the turn should increase
       if space == "X" || space == "O"
         turn += 1
       end
     end
      turn
   end

   def current_player
     if turn_count.even?
       "X"
     else
       "O"
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

   def won?
    WIN_COMBINATIONS.find do |combo|
        if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]]   != " "
        combo
        end
      end
    end

    def full?
      @board.all? { |spot| spot == "X" || spot == "O" }
    end

    def draw?
    # check to see if the board is full, anyone won, or if there is a draw
      !won? && full?
    end

    def over?
      # the game is over if: draw, full or someone won
      won? || full? || draw?
    end

    def winner
        if win_index = won?
          @board[win_index.first]
      end
    end

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

end
