class TicTacToe

  def initialize
    @board = Array.new(9, " ")
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
    horizontalLine = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts horizontalLine
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts horizontalLine
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(myInput)
    index = myInput.to_i - 1
    index
  end

  def move(index, turn="X")
    @board[index] = turn
  end

  def position_taken?(choice)
    !(@board[choice] == " " || @board[choice] == "")
  end

  def valid_move?(choice)
    if (!position_taken?(choice) && choice.between?(0, 8))
      return true
    else
      return false
    end
  end

  def turn
    puts "Enter a number between 1-9"
    player = current_player
    input = gets.strip
    index = input_to_index(input)
    if (valid_move?(index))
      move(index, player)
      display_board
    else
      turn
    end
  end

    def turn_count
      @board.count do |position|
        position == "X" || position == "O"
      end
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        this1 = combo[0]
        this2 = combo[1]
        this3 = combo[2]

        if (@board[this1] == "X" && @board[this2] == "X" && @board[this3] == "X" ||
            @board[this1] == "O" && @board[this2] == "O" && @board[this3] == "O")
            return [combo[0], combo[1], combo[2]]
          end
      end
      return false
    end

    def full?
      @board.none? do |item|
        item == " " || item == ""
      end
    end

    def draw?
      if (full? && won? == false)
        return true
      else
        return false
      end
    end

    def over?
      if (won? != false || draw? == true)
        return true
      else
        return false
      end
    end

    def winner
      if (won? != false)
        winner = @board[won?[0]]
        return winner
      else
        return nil
      end
    end

    def play
      while (!over?)
        turn
      end
      if (draw?)
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end

end
