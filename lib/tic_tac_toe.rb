require 'pry'
class TicTacToe
    WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
      line = "-----------"
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts line
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts line
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(position, character)
     @board[position] = character
     @board
    end

    def position_taken?(index)
        if @board[index] == " " || @board[index] == "" || @board[index] == nil
            #binding.pry
            false
        else
            true
        end
    end

    def valid_move?(index)
        if index.between?(0, 8) && !(position_taken?(index))
            true
        else
            false
        end
    end

    def turn_count
        counter = 0
        @board.each do |value|
            if value == "X" || value == "O"
                counter += 1
            end
        end
        counter
    end

    def current_player
        counter = turn_count
        character = counter.even? ? "X" : "O"
    end
=begin ****** #turn
    ask for input
    get input
    translate input into index
    if index is valid
    make the move for index
    show the board
    else
    ask for input again
    end
=end
    def turn
        puts "Please enter a integer from 1-9: "
        user_input = gets.strip
        position_to_move_to = input_to_index(user_input)
        if valid_move?(position_to_move_to)
            character = current_player
            move(position_to_move_to, character)
            display_board
        else
            turn
        end
    end
    def won?
        WIN_COMBINATIONS.each do |array|
           # create a string of board values for winning combinations
            win_combo = @board[array[0]] + @board[array[1]] + @board[array[2]]
           # compare board string value to winning game values
                if win_combo == "XXX" || win_combo == "OOO"
             # return the win_combination indexes that won
                    return array
                end
        end
        #binding.pry
        false
    end

    def full?
        @board.all? {|value| (value == "X" || value == "O")}
    end

    def draw?
        (full? == true) && (won? == false)? true : false
    end

    def over?
        won? || draw? ? true : false
    end

    def winner
        WIN_COMBINATIONS.each do |array|
            win_combo = @board[array[0]] + @board[array[1]] + @board[array[2]]
            if win_combo == "XXX"
                return "X"
            end
            if win_combo == "OOO"
                return "O"
            end
        end
        nil
    end

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
