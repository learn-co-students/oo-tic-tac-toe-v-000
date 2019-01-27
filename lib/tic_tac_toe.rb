class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    !position_taken?(index) && index.between?(0,8)
  end

   def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

   def current_player
    turn_count.even? ? "X" : "O"
  end

   def turn
    puts "Please enter a number between 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
   end

    def won?
    WIN_COMBINATIONS.detect do |combo|
      pos_1 = @board[combo[0]]
      pos_2 = @board[combo[1]]
      pos_3 = @board[combo[2]]
      pos_1 == "X" && pos_2 == "X" && pos_3 == "X" || pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
     end
    end

     def full?
      @board.all? {|token| token == "X" || token == "O"}
    end

     def draw?
      !won? && full?
    end
     def over?
      won? || full? || draw?
    end

     def winner
      if over? && @board[won?[0]] == "X"
        "X"
      elsif over? && @board[won?[0]] == "O"
        "O"
      else
        nil
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
