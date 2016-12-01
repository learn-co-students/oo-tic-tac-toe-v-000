class TicTacToe

  def initialize(board = nil)
    @board = board || [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row win
    [3,4,5], #middle row win
    [6,7,8], #bottom row win
    [0,3,6], #left column win
    [1,4,7], #middle column win
    [2,5,8], #right column win
    [0,4,8], #diagonal win
    [6,4,2]  #other diagonal win
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player = "X")
    position = position.to_i - 1
    @board[position] = player
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0,8) && !position_taken?(position)
  end

  def turn
    player = current_player
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    turns_taken = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turns_taken += 1
      else
        turns_taken += 0
      end
    end
    return turns_taken
  end

  def current_player
    if turn_count % 2 == 0
      current_player = "X"
    else
      current_player = "O"
    end
    return current_player
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?
    @board.none? do |index|
      index == "" || index == " "
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combination = won?
    if won? == nil
      return nil
    end
    spot_1 = win_combination[0]
    spot_2 = win_combination[1]
    spot_3 = win_combination[2]

    spot_1_value = @board[spot_1]
    spot_2_value = @board[spot_2]
    spot_3_value = @board[spot_3]

    if spot_1_value == "X" && spot_2_value == "X" && spot_3_value == "X"
      winner = "X"
    elsif spot_1_value == "O" && spot_2_value == "O" && spot_3_value == "O"
      winner = "O"
    else
      winner = nil
    end
    return winner
  end

  def play
    until over?
      turn
    end
    if winner == "O"
      puts "Congratulations O!"
    elsif winner == "X"
      puts "Congratulations X!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
