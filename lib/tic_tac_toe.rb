class TicTacToe

  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS =  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def display_board
    puts (" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts ("-----------")
    puts (" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts ("-----------")
    puts (" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def move (location, token = "X")
    @index = location - 1
    @board[@index] = token
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
    if !position_taken?(position) && position.between?(0,9)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    @input = gets.to_i
      until valid_move?(@input)
        puts "Enter again"
        @input = gets.to_i
      end

    @board[@input-1] = current_player
    display_board

  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  i = 0
    while i < 8
        j = 0
        if (@board[WIN_COMBINATIONS[i][j]] == "X" && @board[WIN_COMBINATIONS[i][j+1]] == "X" && @board[WIN_COMBINATIONS[i][j+2]] == "X")
          return WIN_COMBINATIONS[i], "X"

        elsif (@board[WIN_COMBINATIONS[i][j]] == "O" && @board[WIN_COMBINATIONS[i][j+1]] == "O" && @board[WIN_COMBINATIONS[i][j+2]] == "O")
          return WIN_COMBINATIONS[i], "O"

        end
        i += 1
    end
    false
  end

  def full?
    @board.all? { |position| position != " " && position != nil }
  end

  def draw?
    if !won? && full?
      true
    end
  end

  def over?
    if draw?
      true

    elsif won?
      true

    end
  end


  def winner
    if won?
      win_combo, winner = won?
        if winner == "X"
          return "X"
        elsif winner == "O"
          return "O"
        end
    end
  end

  def play
    until over? == true
      turn
    end

    win_combo, winner = won?

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"

    elsif draw?
      puts "Cats Game!"
    end
  end
end
