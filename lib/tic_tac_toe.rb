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
        [2,4,6]
      ]

      board = [ " " , " " , " " , " " , " " , " " , " " , " " , " " ]
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

     def move(index, current_player = "X")
       @board[index] = current_player
     end

     #4. position taken
     def position_taken?(location)
       @board[location] != " " && @board[location] != ""
     end

     #5. valid move
     def valid_move?(index)
       index.between?(0,8) && !position_taken?(index)
     end


     #6. turn method
     def turn
      puts "Please enter 1-9:"
       user_input = gets.strip
       index = input_to_index(user_input)
       if valid_move?(index)
         move(index, current_player)
         display_board
       else
         turn
       end
     end




     #7. turn_count
     def turn_count
         @board.count{|token| token == "X" || token == "O"}
       end

     #8. current_player
     def current_player
         turn_count % 2 == 0 ? "X" : "O"
       end

     #9. won method
     def won?
     WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = @board[win_index_1]
       position_2 = @board[win_index_2]
       position_3 = @board[win_index_3]


       if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
         else
           false
         end
       end
           false
     end


     #10. full method
     def full?
       @board.all? do |position|
         position != " "
       end
     end

     #11. draw method
     def draw?
       !won? && full?
     end

     #12. over method
     def over?
       draw? || won? || full?
     end

     #13. winner method
     def winner
       if !won?
        return nil
      elsif (@board[won?[0]] == "X")
         return "X"
       elsif (@board[won?[0]] == "O")
         return "O"
       end
     end

     #14. play method

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
   end
