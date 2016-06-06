class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Vertical left
  [1, 4, 7], # Vertical middle
  [2, 5, 8], # Vertical right
  [0, 4, 8], # Diagonal left
  [2, 4, 6] # Diagonal right
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player_token)
    position = position.to_i - 1
    @board[position] = player_token
  end

  def position_taken?(position)
    if @board[position] == "O" || @board[position] == "X"
      true
    elsif @board[position] == nil || @board[position] == " "
      false
    end
  end

  def valid_move?(position)
    position = position.to_i
    if position.between?(1, 9) && !(position_taken?((position - 1)))
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    turns = 0
    @board.each do |turns_taken|
      if turns_taken == "X" || turns_taken == "O"
        turns += 1
      end
    end
    puts turns
    turns
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      board1 = win_combination[0]
      board2 = win_combination[1]
      board3 = win_combination[2]

     @board[board1] == @board[board2] && @board[board2] == @board[board3] && @board[board2] != " "
    end
  end

  def full?
    if @board.include?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    if won? == nil && full? == true
      true
    else
      false
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
    # index = won?(board).pop
    if won? == nil
      nil
    elsif @board[won?[0]] == "X"
      "X"
    elsif @board[won?[0]] == "O"
      "O"
    end
  end

  def play

    until over? == true
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end

  end

end
