class TicTacToe
    def initialize()
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [6, 4, 2]
    ]

    def display_board()
      puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        !(@board[index] == " " ||  @board[index] == "" ||  @board[index] == nil)
    end

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
    end

    def turn()
        puts "Please enter 1-9:"
        index = input_to_index(gets.strip)
        token = current_player()
        if valid_move?(index)
            move(index, token)
            display_board()
        else
            turn()
        end
    end

    def turn_count()
        counter = 0
        @board.each do |position|
            if position == "X" || position == "O"
                counter += 1
            end
        end
        return counter
    end

    def current_player()
        turn_count().even? ? "X" : "O"
    end

    def won?()
        WIN_COMBINATIONS.detect do |combo|
            position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
        end
    end

    def full?()
        @board.none?{|el| el.nil? || el == " "}
    end

    def draw?()
        !won?() && full?()
    end

    def over?()
        won?() || full?() || draw?()
    end

    def winner()
        if combo = won?()
            return @board[combo[0]]
        else
            return nil
        end
    end

    def play()
        while !over?()
            turn()
        end
        if winner()
            puts "Congratulations #{winner()}!"
        elsif draw?()
            puts "Cat's Game!"
        end
    end
end
