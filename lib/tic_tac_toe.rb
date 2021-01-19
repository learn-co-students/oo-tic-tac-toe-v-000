class TicTacToe

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [2,5,8]
    ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, player)
        @board[index] = player
    end

    def position_taken?(index)
        if @board[index] == " "
          return false
        elsif @board[index] ==""
          return false
        elsif @board[index] == "X" || @board[index] == "O"
          return true
        else
          return false
        end
    end

    def valid_move?(index)
        if position_taken?(index) == true
          return false
        elsif index.between?(0, 8)
          return true
        else
          return false
        end
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        player = current_player
        if valid_move?(index) == true
            move(index, player)
            display_board
        else
            input = gets.strip
            index = input_to_index(input)
            valid_move?(index)
            puts "Please enter 1-9:"
        end
    end

    def won?
        for x in WIN_COMBINATIONS
          win_index_1 = x[0]
          win_index_2 = x[1]
          win_index_3 = x[2]
          p1 = @board[win_index_1]
          p2 = @board[win_index_2]
          p3 = @board[win_index_3]

          if p1 == "X" && p2 == "X" && p3 == "X"
            return x
          elsif p1 == "O" && p2 == "O" && p3 == "O"
            return x
          end
        end
        false
    end

    def full?
        @board.all?{|cell| cell != ' '}
    end


    def draw?
        if won?
        false
        elsif full?
        true
        else
        false
        end
    end

    def over?
        if won? || draw?
          true
        else
          false
        end
    end

    def winner
        for x in WIN_COMBINATIONS
          win_index_1 = x[0]
          win_index_2 = x[1]
          win_index_3 = x[2]
          p1 = @board[win_index_1]
          p2 = @board[win_index_2]
          p3 = @board[win_index_3]

          if p1 == "X" && p2 == "X" && p3 == "X"
            return 'X'
          elsif p1 == "O" && p2 == "O" && p3 == "O"
            return 'O'
          end
        end
        nil
    end

    def play
        until over?
          turn
        end

        if winner
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end
end
