class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # Left Column
    [1,4,7], # Middle Column
    [2,5,8], # Right Column
    [0,4,8], # Top left to bottom right, diagonal
    [2,4,6] # Top right to bottom left, diagonal
  ]

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

    def move(index, character = "X")
      @board[index] = character
    end

    def position_taken?(location)
      if @board[location] != " " && @board[location] != ""
        return true
      else
        return false
      end
    end

    def valid_move?(index)
      if index.between?(0,8) && !position_taken?(index)
        return true
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(user_input)
      if current_player == "X"
        character = "X"
      elsif current_player == "O"
        character = "O"
      end
      if valid_move?(index)
        move(index, character)
        display_board
      else
        turn
      end
    end

    def turn_count
      counter = 0
      @board.each do |turn|
        if turn == "X" || turn == "O"
    counter += 1
        end
      end
    return counter
    end

    def current_player
      if turn_count % 2 == 0
        "X"
      else
        "O"
      end
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combination
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination
          end
      end
      false
    end

    def full?
      if @board.all?{|position| position == "X" || position == "O"}
        return true
      end
    end

    def draw?
      if !won? && full?
        return true
      end
    end

    def over?
      if won? || full? || draw?
        return true
      end
    end

    def winner
      if won?
        win_combination = won?
        winner = win_combination[0]
        return @board[winner]
      end
    end

    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
    end
  end
