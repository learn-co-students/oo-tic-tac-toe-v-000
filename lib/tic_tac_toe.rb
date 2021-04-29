class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

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

    def position_taken?(index)
      !(@board[index].nil? || @board[index] == " ")
    end

    def move(index, value)
      @board[index] = value
    end

    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
      counter = 0
      @board.each do |token|
        if token == "X" || token == "O"
          counter += 1
        end
      end
      counter
    end

    def current_player
      if turn_count % 2 == 0
        "X"
      else
        "O"
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        puts "Please enter 1-9:"
        input = gets.strip
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |winning_combination|
        position_1 = @board[winning_combination[0]]
        position_2 = @board[winning_combination[1]]
        position_3 = @board[winning_combination[2]]
        position_1 == position_2 && position_2 == position_3 && position_taken?(winning_combination[0])
      end
    end

    def full?
      @board.all? do |token|
        token == "X" || token == "O"
      end
    end

    def draw?
      won? == nil && full? == true

    end

    def over?
      won? != nil || draw?
    end

    def winner
      if won? != nil
        @board[won?[0]]
      else
        nil
      end
    end

    def play
      while over? == false
        turn
        won?
      end
      if won? != nil
        puts "Congratulations #{winner}!"
      end
      if draw?
        puts "Cat's Game!"
      end
    end
end
