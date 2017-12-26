class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

      def move(index, token)
        @board[index] = token
      end

      def position_taken?(location)
        @board[location] != " " && @board[location] != ""
        end

        def valid_move?(index)
          index.between?(0,8) && !position_taken?(index)
        end

        def turn_count
          counter = 0
          @board.each do |turns|
            if turns == "X" || turns == "O"
          counter += 1
          end
          end
          return counter
        end

        def current_player
        num = turn_count
          if num % 2 == 0
          return "X"
          else
            return"O"
          end
        end


      def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      token = current_player
      if valid_move?(index)
          move(index, token)
          display_board
      else
          turn
      end
      end

      def won?
          WIN_COMBINATIONS.each do |win|
          test_position1 = win[0]
          test_position2 = win[1]
          test_position3 = win[2]

          position1 = @board[test_position1]
          position2 = @board[test_position2]
          position3 = @board[test_position3]

            if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
                 return win
              end
          end
          false
        end


        def full?
          @board.all? do |token|
           token == "X" || token == "O"
          end
        end


        def draw?
          if !won?&& full?
            return true
          else
            false
          end
        end


        def over?
          if won? || full? || draw?
            return true
          end
        end


        def winner
          if winning_combo = won?
            return @board[winning_combo[0]]
          else
            return nil
        end
        end


      def play
        until over? || draw?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        else
          puts "Cat's Game!"
      end
      end


end
