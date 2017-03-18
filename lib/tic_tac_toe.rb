class TicTacToe
    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count do |turns|
            turns != " "
        end
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
      puts "Please enter a number 1-9:"
      user_input = gets.strip
      puts "You have enter #{user_input}."
      index = input_to_index(user_input)
      if valid_move?(index)
        move(index, current_player)
      else
          turn
      end
      display_board
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
             @board[win_combo[0]] == @board[win_combo[1]] &&
             @board[win_combo[1]] == @board[win_combo[2]] &&
             position_taken?(win_combo[0])
        end
    end

    def full?
        @board.all? {|token| token != " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || full?
    end

    def winner
        if winner = won?
            @board[winner[0]]
        end
    end

    def play
        while !over? && !draw?
          turn
        end
        puts "Please enter a number from 1-9"
        puts winner ?  "Congratulations #{winner}!" : "Cat's Game!"
    end

end
