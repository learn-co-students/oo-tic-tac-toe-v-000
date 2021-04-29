class TicTacToe

  def initialize(board = nil)
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
    [2,4,6]]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      index = input.to_i - 1
    end

    def move(index, char)
      @board[index] = char
    end

    def position_taken?(index)
      @board[index] == " " || @board[index] == "" || @board[index] == nil ? false : true
    end

    def valid_move?(index)
      !position_taken?(index) && (index >= 0 && index < 9) ? true : false
    end

    def turn_count
      @board.count{ |token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else turn
      end
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|

        if ((position_taken?(win_combination[0])) &&  (@board[win_combination[0]] == "X")) && ((position_taken?(win_combination[0])) && (@board[win_combination[1]] == "X")) &&
          ((position_taken?(win_combination[0])) && (@board[win_combination[2]] == "X"))
          return win_combination
      elsif ((position_taken?(win_combination[0])) && (@board[win_combination[0]] == "O")) && ((position_taken?(win_combination[0])) && (@board[win_combination[1]] == "O")) &&
        ((position_taken?(win_combination[0])) && (@board[win_combination[2]] == "O"))
          return win_combination
      end
    end
      return false
    end

    def full?
      @board.all? {|cell| cell != " "}
    end

    def draw?
    !won? && full? ? true : false
    end

    def over?
      won? || full? || draw? ? true : false
    end

    def winner
      won? ? @board[won?[0]] : nil
    end

    def play
      while !over?
        turn
      end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end

  end

end
