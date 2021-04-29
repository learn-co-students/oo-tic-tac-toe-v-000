class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #middle row win
  [6, 7, 8], #bottom row win
  [0, 4, 8], #diagonal win
  [6, 4, 2], #diagonal win
  [0, 3, 6], #left column win
  [1, 4, 7], #middle column win
  [2, 5, 8]  #right column win 
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player)
    @board[location.to_i - 1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != "" && @board[position] != nil
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
    else
      turn
   end
    display_board
  end

  def turn_count
    turns = 0
    @board.each do |letter|
      if (letter == "X" || letter == "O")
        turns +=1
      end
    end
    turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

      if ((position_1 == "X") && (position_2 == "X") && (position_3 == "X")) || ((position_1 == "O") && (position_2 == "O") && (position_3 == "O"))
        return [win_index_1, win_index_2, win_index_3]
      end
    end
    return false
  end

  def full?
    @board.all? do |position|
      if (position == "X") || (position == "O")
        true
      else
        false
      end
    end
  end

  def draw?
    if (full? == true) && (won? == false)
      true
    elsif (won? != false)
      false
    else
      false
    end
  end

  def over?
    won? != false || draw? == true
  end

  def winner
    if won? != false
      character = won?[0]
      winner = @board[character]
      if winner == "X"
        return "X"
      elsif winner == "O"
        return "O"
      else
        nil
      end
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
