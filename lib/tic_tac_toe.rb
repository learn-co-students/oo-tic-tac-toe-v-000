
class TicTacToe
  def initialize(board = nil)
    @board =  Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5], # Middle row
      [6,7,8], # Bottom row
      [0,3,6], # Left column
      [1,4,7], # Middle column
      [2,5,8], # Right column
      [0,4,8], # Left diagonal
      [2,4,6]  # Right diagonal
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

      def move(index, value = "X")
        @board[index] = value
      end

      def position_taken?(index)
        if @board[index] == " "
          false
        elsif @board[index] == ""
          false
        elsif @board[index] == nil
          false
        else @board[index] == "X" || @board [index] == "O"
          true
        end
      end

      def valid_move?(index)
        index.between?(0,8) &&
       !position_taken?(index)
      end

      def turn_count
        occupied_spaces = 0
          @board.each do |space|
            if space == "X" || space == "O"
              occupied_spaces += 1
            end
          end
        occupied_spaces
      end

      def current_player
        if turn_count % 2 == 0
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
      #   x = 0
      #   while x < 9
      #     x += 1
      #     turn
      # end
end
      def won?
        WIN_COMBINATIONS.detect do |match_array|
          position_taken?(match_array[0]) &&
          @board[match_array[0]] == @board[match_array[1]] &&  #the value in the first index and the second index are the same value and
          @board[match_array[1]] == @board[match_array[2]]     #the value in the second index and the third index are the same value
          # each time the top row, [0,1,2] all have "Xs" or all have "Os", then it is a won? = true
        end
      end

      def full?
      @board.all?{|i| i=="X" || i=="O"} #using the iterator #all? to check that ALL the indexes on the BOARD has a value of either "X" or "O"
      end

      def draw?
        !won? && full? #returns true if the board has not been won and if the board is full
              #anything else returned is false
      end

      def over?
        won? || draw? || full?  # returs true if the board has been won or if there is a draw or if the board is full.
      end
      #
      # def winner  #accept a board and return the token "X" or "O" that has won the game giving the winning board.
      #   @board[won?[0]]
      # end
      def winner
          if winning_combo = won?
          @board[winning_combo.first]
        end
      end

      def play
          while !over?
            turn
          end
          if won? && winner == "X"
            puts "Congratulations X!"
          elsif  won? && winner == "O"
              puts "Congratulations O!"
          elsif draw?
            puts "Cat's Game!"
          else
          end
      end

end

# x = 0
# while x < 9
#   x += 1
#   turn(board)  #calls the turn method 9 times
# end
