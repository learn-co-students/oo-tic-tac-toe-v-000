class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new([" ", " ", " ", " ", " ", " ", " ", " ", " "])
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @user_input = user_input
    @index = @user_input.to_i - 1
  end

  def move(index, char)
    @index = index
    @char = char
    @board[@index] = @char
  end

  def position_taken?(index)
    @index = index
    if @board[@index] == "" || @board[@index] == " " || @board[@index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    @index = index
    if position_taken?(index) == false && @index.between?(0, 8)
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |cell_value|
      if cell_value == 'X' || cell_value == 'O'
        counter += 1
        puts "Turn number #{counter}"
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return 'X'
    else
      return 'O'
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    @index = input_to_index(user_input)
    if valid_move?(@index) == true #&& position_taken?(@index) == false
      @char = current_player
      move(@index, @char)
      display_board
    elsif valid_move?(@index) == false
      puts "Please enter a valid number, or the number for an unoccupied space"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_index|
      position_1 = @board[win_index[0]]
      position_2 = @board[win_index[1]]
      position_3 = @board[win_index[2]]

      position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
  end

  def full?
    @board.all?{|position| position != " "}
  end

  def draw?
    if won? != nil ||
      full? == false
      return false
    else
      @board.all? do |position|
        position != "X" || "O"
      end
    end
  end

  def over?
    if won? != nil ||
      draw? == true ||
      full? == true
      return true
    end
  end

  def winner
    if over? == false || draw? == true
      nil
    elsif over? == true
      win_combo = won?
      char = @board[win_combo[0]]
      return char
    end
  end

  def play
    until over? == true
      turn
    end

    if won? != nil
      puts "Congratulations #{winner}!"
    end

    if draw? == true
      puts "Cat's Game!"
    end
  end

end
