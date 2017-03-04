class TicTacToe
  def initialize
    board = Array.new(9, " ")

    @board = board
  end

  def board=(board)
    @board = board 
  end
  def board
    @board
  end

    WIN_COMBINATIONS = [
      [0, 1, 2], #top row
      [3, 4, 5], #middle row
      [6, 7, 8], #bottom row
      [0, 3, 6], #left columns
      [1, 4, 7], #middle columns
      [2, 5, 8], #right columns
      [0, 4, 8], #diagonal 1
      [2, 4, 6] #diagonal 2
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
    
    def move(index, current_player)
      index = input_to_index
      @board[index] = current_player
    end

    def move(index, value)
      @board[index] = value
    end

    def position_taken?(index)
      if @board[index] == " " || @board[index] == "" || @board == nil
        return false
      else
        return true
      end
    end

    def valid_move?(index)
      if index.between?(0, 8) && position_taken?(index) == false
        return true
      end
    end

    def turn
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        value = current_player
        move(index, value)
        display_board
      else
        turn
      end
    end

    def turn_count
      count = 0
      @board.each do |player|
        if player == "X" || player == "O"
        count += 1
        end
      end
      return count
    end

    def current_player
      if turn_count.odd?
        current_player = "O"
      else
        current_player = "X"
      end
    end

    def won?
        WIN_COMBINATIONS.detect {|combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"}
    end

    def full?
      @board.none? {|play| play == nil || play == " "}
    end
    
    def draw?
      if full? && !won?
      return true
      end
    end

    def over?
      draw? || won?
    end

    def winner
      if WIN_COMBINATIONS.any? {|combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"} == true
        return "X"
      elsif WIN_COMBINATIONS.any? {|combo| @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"} == true
          return "O"
      else
        return nil
      end
    end

    def play
      turn until over?
        if winner == "X"
          puts "Congratulations X!"
        elsif winner == "O"
          puts "Congratulations O!"
        else
          puts "Cat's Game!"
        end
      end

end