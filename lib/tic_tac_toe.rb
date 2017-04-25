class TicTacToe
  def initialize(board_array = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board_array
  end

  def board=(board_array)
    @board = board_array
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row win
    [3, 4, 5], #middle row win
    [6, 7, 8], #bottom row win
    [0, 3, 6], #first column win
    [1, 4, 7], #second column win
    [2, 5, 8], #third column win
    [0, 4, 8], #first diagonal win
    [2, 4, 6] #second diagonal win
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

  def user_input=(user_input)
    @user_input = user_input
  end

  def user_input
    @user_input
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
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
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] =="X"
        return win
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] =="O"
        return win
      else
        false
      end
    end
  end

  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end


  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    WIN_COMBINATIONS.detect do |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] =="X"
        return "X"
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] =="O"
        return "O"
      else
        false
      end
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end


end
