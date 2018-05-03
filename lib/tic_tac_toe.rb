class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2], #top row win
        [3,4,5], #middle row win
        [6,7,8], #bottom row win 
        [0,3,6], #column 1 win
        [1,4,7], #middle column win
        [2,5,8], #column 3 win
        [0,4,8], #diagonal win 
        [2,4,6] #diagonal win
      ]

    def initialize(board = Array.new(9, " "))
        @board = board
    end

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
        !(@board[index].nil? || @board[index] == " ")
    end
    
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        count = 0 
        @board.map do |occupied|
            if occupied == "X" || occupied == "O" 
                count +=1
            end
        end
        count
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end 

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
            if valid_move?(index)
                move(index, current_player)
                display_board
            else
                turn
            end 
    end

    def won?
        WIN_COMBINATIONS.detect do |array|
           @board[array[0]] == @board[array[1]] && 
           @board[array[1]] == @board[array[2]] &&
           position_taken?(array[0])
        end
    end 

    def full?
        @board.all? do |answer|
          answer != " " ? true : false
        end
   end

    def draw?
        !won? && full? ? true : false
    end
  
    def over?
        won? || draw? ? true : false
    end
  
    def winner
        if a = won?
            @board[a.first]
        end
    end

    def play
        while !over?
            turn   
        end
    
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end