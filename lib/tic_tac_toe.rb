class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def initialize
        @board = Array.new(9, " ")
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

    def move(index, player = "X")
      @board[index] = player
      display_board
    end

    def position_taken?(index)
      @board[index] != nil && @board[index] != "" && @board[index] != " "
    end

    def valid_move?(index)
      index.between?(0, 8) && position_taken?(index) == false
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
      else
        puts "invalid input! Try again"
        turn
      end
    end

    def turn_count
      count = 0
      @board.each do |spot|
        if spot == "X" || spot == "x" || spot == "O" || spot == "o"
            count += 1
        end
      end
      count
    end

    def current_player
      if turn_count.even?
        return "X"
      else
        return "O"
      end
    end

    def won?
      WIN_COMBINATIONS.each  do |winner|
        if winner.all? {|index| @board[index] == "X"}
            return winner
        elsif winner.all? {|index| @board[index] == "O"}
            return winner
        end
      end
      false
    end

    def full?
      @board.all? { |element| element == "X" || element == "O"}
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw?
    end

    def winner
      if won? == false
        return nil
      else
        return @board[won?[0]]
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