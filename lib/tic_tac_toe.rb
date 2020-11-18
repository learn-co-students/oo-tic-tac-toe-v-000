class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

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

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} ", 
             "-----------", 
             " #{@board[3]} | #{@board[4]} | #{@board[5]} ", 
             "-----------", 
             " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        index = user_input.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
            false
        else
            true
        end
    end
 
    def valid_move?(index)
       index.between?(0,8) && position_taken?(index) == false
    end


    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        char = current_player
        if valid_move?(index)
          move(index, char)
          display_board
        else
          turn
        end
    end

    def turn_count
        turn = 0
        @board.each do |index|
            if index == "X" || index == "O"
                turn += 1
            end
        end
        turn
    end

    def current_player
        if turn_count.even? 
            return "X"
        elsif turn_count.odd?
            return "O"
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
          if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
            return win_combo
          elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
            return win_combo
          end
            false
        end
      end

    def full?
        if @board.include?(" ")
            false
        else
            true
        end
    end
    
    def draw?
        full? && !won?
    end

    def over?
        full? || won? || draw?
    end

    def winner
      if win_combo = won?
        @board[win_combo.first]
      end
    end

    def play
        while over? == false
            turn
        end
            if won?
                puts "Congratulations #{winner}!"
            else draw?
                puts "Cat's Game!"
            end
    end
end

 


