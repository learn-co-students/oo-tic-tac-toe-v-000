require 'pry'
class TicTacToe
  def initialize (board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

       WIN_COMBINATIONS =[
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

       def input_to_index(value)
         value.to_i - 1
       end

       def move(index, token = "X")
          @board[index] = token
       end

       def position_taken?(index)
         @board[index] == "X" || @board[index] == "O"
      end

      def valid_move?(index)
          index.between?(0,8) != position_taken?(index)
      end

      def turn
        puts "Please enter 1-9:"
        value = gets.strip
        index = input_to_index(value)
        if valid_move?(index)
          move(index,current_player)
          display_board
        else
          turn
        end
      end

      def turn_count
        @board.count("X") + @board.count("O")
      end

      def current_player
        if turn_count.even?
          "X"
        else
          "O"
        end
      end

      def won?
      WIN_COMBINATIONS.detect do |win_combo|
      position_1 = @board[win_combo[0]]
      position_2 = @board[win_combo[1]]
      position_3 = @board[win_combo[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"

       return win_combo
        end
      end
     end

     def full?
       turn_count > 7
      end

      def draw?
         full? && !won?
      end
      def over?
        won? || full? || draw?
      end

      def winner
        if won?
          @board[won?[0]]
        end
      end
end
