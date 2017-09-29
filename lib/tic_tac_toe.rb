class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS =
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ]

      def display_board(board = nil)
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def input_to_index(user_input)
        user_input.to_i - 1
      end

      def move(board = nil, index, current_player)
        @board[index] = current_player
      end

      def turn_count(board = nil)
        counter = 0
        @board.each do |token|
        if token == "O" || token == "X"
         counter += 1
       end
        end
        counter
      end

      def current_player(board = nil)
        if turn_count(board = nil) % 2 == 0
          "X"
        else
          "O"
        end
      end


      def position_taken?(board = nil, location)
        @board[location] != " " && @board[location] != ""
      end

      def valid_move?(board = nil, index)
        index.between?(0,8) && !position_taken?(board = nil, index)
      end

      def turn(board = nil)
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(board, index)
          move(board = nil, index, current_player(board = nil))
          display_board(board = nil)
        else
          turn(board = nil)
        end
      end

      # Define your play method below
      def play(board = nil)
       turn(board = nil) until over?(board = nil)
       if won?(board = nil)
         puts "Congratulations #{winner(board)}!"
       elsif draw?(board = nil)
         puts "Cat's Game!"
       end
      end

      def won?(board = nil)
          WIN_COMBINATIONS.each do |positions|
            win_index_0 = positions[0]
            win_index_1 = positions[1]
            win_index_2 = positions[2]
            if @board[positions[0]] == "X"  && @board[positions[1]] == "X" &&  @board[positions[2]] == "X"
              return positions
            elsif @board[positions[0]] == "O"  && @board[positions[1]] == "O" &&  @board[positions[2]] == "O"
              return positions
            end
          end
          false
      end

      def full?(board = nil)
        @board.all? do |positions|
            positions == "O"  || positions == "X"
        end
      end

      def draw?(board = nil)
      !won?(board = nil) && full?(board = nil)

      end

      def over?(board = nil)
      won?(board = nil) || full?(board = nil) || draw?(board = nil)
      end

      def winner(board = nil)
      win_combination = won?(board = nil)
      if won?(board = nil)
      @board [win_combination[0]]
      end
      end

end
