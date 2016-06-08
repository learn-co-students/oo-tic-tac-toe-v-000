class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
    position = location.to_i - 1
    @board[position] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " " || @board[index] == "")
  end

  def valid_move?(position)
    location = position.to_i - 1
    if position_taken?(location)
      false
    elsif location < 0 || location > 8
      false
    else
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    the_answer = false
    WIN_COMBINATIONS.each do |win_combination| # Scope Gate
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      a_win = [position_1, position_2, position_3].uniq.size == 1 && position_1 != " "
      if a_win
        the_answer = win_combination
      end
    end
    the_answer
  end

  def full?
    full_board = @board.all? do |space|
      space == "X" || space == "O"
    end
    return full_board
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    winning_arr = won?
    if winning_arr.class == Array && @board[winning_arr[0]] == "X"
      return "X"
    elsif winning_arr.class == Array && @board[winning_arr[0]] == "O"
      return "O"
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
