class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

    def input_to_index(input)
        index = input.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
      end

      def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
      end

      def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
      end

      def turn_count
        @board.count {|player| player == "X" || player == "O"}
      end

      def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end

      def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
          move(index, token=current_player)
          display_board
        else
          turn
          display_board
        end
      end

      def won?
       WIN_COMBINATIONS.detect do |win_combo|
         if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
         return win_combo
       elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
         return win_combo
          end
        end
      end

      def full?
        @board.all? do |i|
          i == "X" || i == "O"
        end
      end

      def draw?
        if !won? && full?
        true
       else
        false
       end
      end

      def over?
        if draw? || full? || won?
          true
        else
          false
        end
      end

      def winner
        if winning_combo = won?
          index = winning_combo.first
          @board[index]
        end
      end

    def play
      until over?
        turn
      end
      if draw?
        puts "Cat's Game!"
      else won?
        puts "Congratulations #{winner}!"
      end
    end
end
