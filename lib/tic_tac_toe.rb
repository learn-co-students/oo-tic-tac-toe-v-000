class TicTacToe

    def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
        @board = board
    end

    WIN_COMBINATIONS = [
        [0, 1 ,2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
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

    def move(index, user_token)
        @board[index] = user_token
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
        end
    end

    def valid_move?(index)
        if index.between?(0, 8) && !position_taken?(index)
            return true
        else
            return false
        end
    end

    def turn_count
        count = 0
        @board.each do |element|
            if element == "X" || element == "O"
                count += 1
            end
        end
        return count
    end

    def current_player
        count = self.turn_count
        if count % 2 == 0
            return "X"
        else
            return "O"
        end
    end

    def turn
        puts "Input number between 1-9: "
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            user_token = self.current_player
            move(index, user_token)
            self.display_board
        else
            self.turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combination|
            index_1 = win_combination[0]
            index_2 = win_combination[1]
            index_3 = win_combination[2]

            position_1 = @board[index_1]
            position_2 = @board[index_2]
            position_3 = @board[index_3]

            (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        end
    end

    def full?
        @board.all? do |element|
            element == "X" || element == "O"
        end
    end

    def draw?
        if self.won? || !self.full?
            return false
        else
            return true
        end
    end

    def over?
        if self.draw? || self.won?
            return true
        else
            return false
        end
    end

    def winner
        if self.won? != nil
            winner_index = self.won?[0]
            winner_player = @board[winner_index]
            return  winner_player
        end
    end

    def play
        while !self.over?
            self.turn
        end
        if self.won? != nil
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end

end
