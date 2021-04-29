class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(input)
    int = input.to_i - 1

    return int
  end

  def move(index, value = "X")
    @board[index] = value
  end

  def position_taken?(index)

    case @board[index]
    when " ", "", nil then false
    when "X", "O" then true
    end

  end

  def valid_move?(index)

    if index.between?(0, 8)
      if !position_taken?(index)
        true
      end
    end

  end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
      else
        turn
      end
      display_board

    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.detect do |win_combo|
        @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X" ||
        @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
      end
    end

    def full?
      @board.all? { |spaces| spaces == "X" || spaces == "O" }
    end

    def draw?
      if !won? && full?
        true
      end
    end

    def over?
      if won? || draw? || full?
        true
      end
    end

    def winner
      winner = won?

      if winner.nil?
        nil
      elsif @board[winner[0]] == "X"
        return "X"
      elsif @board[winner[0]] == "O"
        return "O"
      end

    end

    def play
      until over?
        turn
      end

      puts "Cat's Game!" if draw?
      puts "Congratulations #{winner}!" if won?
    end
end
