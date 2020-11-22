class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize
        @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        return input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token

    end

    def position_taken?(index)
        return !@board[index].strip.empty?
    end

    def valid_move?(index)
        return index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.select{|position| !position.strip.empty?}.count
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter a number (1-9):"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index) 
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.each do |i|
            if @board[i[0]] == "X" && @board[i[1]] == "X" && @board[i[2]] == "X" || 
                @board[i[0]] == "O" && @board[i[1]] == "O" && @board[i[2]] == "O"
                return i
            end
        end
        return false
    end

    def full?
        return turn_count == 9
    end

    def draw?
        return full? && !won?
    end

    def over?
        return draw? || won?
    end

    def winner
        if won?
            @board[won?[0]]
        end
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

end