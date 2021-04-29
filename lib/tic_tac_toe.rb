class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # mid column
  [2,5,8], # right column
  [0,4,8], # diag 1
  [6,4,2] # diag 2
]
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(pos, char="X")
    @board[pos-1] = char
  end

  def position_taken?(pos)
    @board[pos] == "X" || @board[pos] == "O"
  end

  def valid_move?(pos)
    if pos.to_i >= 1 && pos.to_i <= 9
      if !position_taken?(pos.to_i-1)
        return true
      end
    end
    false
  end

  def turn
    puts "Enter position 1-9"
    pos = gets.strip
    until pos == pos.to_i.to_s
      pos = gets.strip
    end
    move(pos.to_i,current_player)
  end

  def turn_count
    count = 0
    @board.each do |spot|
      if spot != " "
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      won = combo.all? do |pos|
        @board[pos] == "X"
      end
      if won
        return true
      end
      won = combo.all? do |pos|
        @board[pos] == "O"
      end
      if won
        return true
      end
    end
    false
  end

  def full?
    @board.all? do |spot|
      spot != " "
    end
  end


  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      won = combo.all? do |pos|
        @board[pos] == "X"
      end
      if won
        return "X"
      end
      won = combo.all? do |pos|
        @board[pos] == "O"
      end
      if won
        return "O"
      end
    end
    nil
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