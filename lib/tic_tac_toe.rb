class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move (user_input, character)
    @board[user_input] = character
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    elsif @board[index] == " " || "" || nil
      false
    end
  end

  def valid_move?(index)
    if !(position_taken?(index)) && index.between?(0,8)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)

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
   return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" || @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        return combination
      end
    end
    return false
  end

  def full?
    @board.each do |index|
      if index != "X" && index != "O"
        return false
      end
    end
    return true
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || full? || won?
      true
    end
  end

  def winner
    WIN_COMBINATIONS.detect do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        return "X"
      elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        return "O"
      end
    end
    nil
  end

  def play
    until over?
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
