class TicTacToe

  WIN_COMBINATIONS = [
  [0, 1, 2], #Top Row
  [3, 4, 5], #Middle Row
  [6, 7, 8], #Bottom Row
  [0, 3, 6], #Left Column
  [1, 4, 7], #Middle Column
  [2, 5, 8], #Right Column
  [0, 4, 8], #Left Diagonal
  [2, 4, 6] #Right Diagonal
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def move(position, character)
    @board[position] = character
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
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

  def won?
    WIN_COMBINATIONS.any? do |wincombo|
      if @board[wincombo[0]] == "X" && @board[wincombo[1]] == "X" && @board[wincombo[2]] == "X"
        return wincombo
      elsif @board[wincombo[0]] == "O" && @board[wincombo[1]] == "O" && @board[wincombo[2]] == "O"
        return wincombo
      end
    end
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
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
