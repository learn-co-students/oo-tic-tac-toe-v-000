class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top rows
    [3, 4, 5], #middle rows
    [6, 7, 8], # bottom rows
    [0, 3, 6], #lvert
    [1, 4, 7], #mvert
    [2, 5, 8], #rvert
    [0, 4, 8], # diag1
    [2, 4, 6] # diag2
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

    def move(input, value = "X")
      @board[input] = value
    end

    def position_taken?(index)
      if @board[index] == " "
        false
      elsif @board[index] == ""
        false
      elsif @board[index] == nil
        false
      elsif @board[index] == "X" || "O"
        true
      end
    end

    def valid_move?(index)
    index.to_i.between?(0, 8) && !position_taken?(index)
    end

    def turn_count
     counter = 0
      @board.count {| space | space == "X" || space == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
      puts "Please enter 1-9:"
      user_input = gets.strip.to_i
      index = input_to_index(user_input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def won?
      WIN_COMBINATIONS.each do | winning_combination |
        if @board[winning_combination[0]] == "X" &&
           @board[winning_combination[1]] == "X" &&
           @board[winning_combination[2]] == "X" ||
           @board[winning_combination[0]] == "O" &&
           @board[winning_combination[1]] == "O" &&
           @board[winning_combination[2]] == "O"
        return winning_combination
        end
      end
      false
    end

    def full?
    @board.all? do |token|
      token =="X" || token =="O"
      end
    end

    def draw?
      if !won? && full?
        true
      else won?
        false
      end
    end

    def over?
      if won? || draw?
        true
      end
    end

    def winner
      if winning_combination = won?
        @board[winning_combination[0]]
        end
    end

    def play
      until over?
        turn
      end
      if winner == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
      if draw?
      puts "Cat's Game!"
      end
    end
  end
