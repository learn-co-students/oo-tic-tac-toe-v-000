class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 4, 8],
    [3, 4, 5],
    [6, 7, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
      puts "-----------\n"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
      puts "-----------\n"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    end

    def input_to_index(input)
      @index = "#{input}".to_i - 1
      return @index
    end

    def move(index, character = "X")
      puts @board[index] = character
    end

    def position_taken?(index)
      @board[index] == "X" || @board[index] == "O"
    end


    def valid_move?(index)
      if index.between?(0, 8) == false || position_taken?(index) == true
        return false
      else
        return true
      end
    end

    def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
      while !valid_move?(index)
      puts "invalid"
      input = gets.strip
      index = input_to_index(input)
      end
    puts move(index, current_player)
    puts display_board
    end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|
        if ((@board[win_combination[0]] == "X" || @board[win_combination[0]] == "O") &&
          (@board[win_combination[0]] == @board[win_combination[1]]) &&
          (@board[win_combination[1]] == @board[win_combination[2]]) &&
          (@board[win_combination[2]] == @board[win_combination[0]]))
          @win_combination = win_combination
          return win_combination
          return true
        end
      end
        return false
      end

      def full?
        if @board.include?(" ") || @board.include?("")
          return false
        else true
        end
      end

      def draw?
        puts "Cat's Game!"
        if full? && !won?
        return true
        else won?
        return false
      end
      end

      def over?
        if @board.include?(" " || "")
          return false
        else true
        end
      end

      def winner
        if won?
          return @board[@win_combination[0]]
        else
          return nil
        end
      end

      def play
        while !over?
        puts turn
        puts won?
        puts draw?
        end
        if won?
          puts "Congratulations #{winner}!"
        else draw?
        end
      end
end
