class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current_player = "X")
    @board[index - 1] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " " || @board[index] == "")
  end

  def valid_move?(index)
    (index.to_i - 1).between?(0,8) && !position_taken?(index.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i
    if valid_move?(index)
      char = current_player
      move(index, char)
      display_board
   else
     turn
    end
  end

  def turn_count
    turns = 0
    @board.each do |value|
      if value == "X" || value == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |cmb|
      if position_taken?(cmb[0]) && @board[cmb[0]] == @board[cmb[1]] && @board[cmb[1]] == @board[cmb[2]]
        return cmb
      end
    end
  end

  def full?
    if @board.all? {|pos| !(pos.nil? || pos == " " || pos == "")}
      return true
    end
  end

  def draw?
    if full? && won? == false
      return true
    end
  end

  def over?
    if won? || draw?
      return true
    end
  end

  def winner
    if won?
      cmb = won?
      return @board[cmb[0]]
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
    elsif draw?
      puts "Cats Game!"
    end
  end
end