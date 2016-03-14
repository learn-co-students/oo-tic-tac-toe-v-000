

class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6],
  [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

  def move(position, current_player)
    @board[position.to_i - 1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9"
    position = gets.strip
    if valid_move?(position) == true
      move(position,current_player)
    else
      turn
    end
  end

  def turn_count
    counter = 0 
    @board.each do |spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |wincombos|
      if (@board[wincombos[0]] == "X" || @board[wincombos[0]] == "O") && @board[wincombos[0]] == @board[wincombos[1]] && @board[wincombos[1]] == @board[wincombos[2]]
        return wincombos
      end
    end
  end

  def full?
    @board.none? {|spot| spot == " " || spot == nil}
  end

  def draw?
end