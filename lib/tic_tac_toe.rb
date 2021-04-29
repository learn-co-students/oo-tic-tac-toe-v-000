require 'pry'

class TicTacToe

    def initialize(board=nil)
    @board = Array.new(9," ")
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

    def input_to_index(user_input)
      user_input.to_i - 1
    end

    def move(index,token="X")
      @board[index] = token
    end

    def position_taken?(index)
    @board[index] != " " && @board[index] != ""
    end

    def valid_move?(index)
      if index.between?(0,8) && !position_taken?(index)
        true
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
      else
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
      end
    end

      def turn_count
      counter = 0
      @board.each do |pos|
      if pos == "X" || pos == "O"
          counter += 1
        end
      end
      counter
      end

      def current_player
      if turn_count.even?
      return "X"
      else
        return "O"
      end
    end

    def won?
    WIN_COMBINATIONS.detect do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    pos_1 = @board[win_index_1]
    pos_2 = @board[win_index_2]
    pos_3 = @board[win_index_3]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
    return win_combination
    end
    if pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
    return win_combination
    end
    end
    end

    def draw?
      full? && !won?
    end

    def over?
      if draw? || won?
        true
      else
        false
      end
    end

    def full?
      @board.all?{|token| token == "X" || token == "O"}
    end

    def winner
      if won?
        won?.select do |pos|
      if @board[pos[0]] == "X"
        return "X"
      else @board[pos[0]] == "O"
        return "O"
      end
      end
    end
  end

  def play
  until over? || won? || draw?
    turn
  end
    if winner
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
  end
  end
end


game=TicTacToe.new
game.display_board
