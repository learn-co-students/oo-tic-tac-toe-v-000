class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def input_to_index(user_input)
      user_input.to_i - 1
    end

    def move(index, current_player)
      @board[index] = current_player
    end

    def position_taken?(index)
     if board[index] == " " or board[index] == "" or board[index] == nil
      false
    elsif board[index] == "X" or "O"
      true
     end
    end

    def valid_move?(index)
      if (position_taken?(index) == true) or index >= 9
       false
     elsif (position_taken?(index) == false) && index.between?(0, 8)
       true
      end
    end

    def turn
      puts "Please enter a number (1-9):"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        token = current_player
        move(index, token)
      else
        turn
      end
      display_board
    end

    def draw?
      full? && !won?
    end

    def won?
      WIN_COMBINATIONS.detect do |win_combination|
        board[win_combination[0]] == board[win_combination[1]] &&
        board[win_combination[1]] == board[win_combination[2]] &&
        position_taken?(win_combination[0])
      end
    end

    def full?
      @board.all?{|player| player == "X" || player == "O"}
    end

    def over?
      won? || draw?
    end

    def winner
      if winning_combo = won?
        @board[winning_combo.first]
      end
    end

    def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end
