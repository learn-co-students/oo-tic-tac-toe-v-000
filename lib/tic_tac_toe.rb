class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

   def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5], 
  [6, 7, 8], 
  [6, 4, 2], 
  [0, 4, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8]
]

  def move(position, current_player = "X")
    @board[(position.to_i - 1)] = current_player
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    elsif @board[position] == "" || @board[position] == " " || @board[position] == nil
      return false
    end
        

  end

  def valid_move?(position)
      position = position.to_i - 1
  if position_taken?(position) == false && position.between?(0, 10)
    return true
  elsif @board[position] == "X" || @board[position] == "O"
    return false
  end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      puts "Invalid input, try again:"
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
    WIN_COMBINATIONS.detect do |combo|
      
   @board[combo[0]] == @board[combo[1]] &&
   @board[combo[1]] == @board[combo[2]] &&
   position_taken?(combo[0])
      end
  end

  def full?
      @board.all? do |token|
      token == "X" || token == "O"
end 
  end

  def draw?
      full? && !won?
  end

  def over?
      won? || draw? || full?
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
  if over?
    if won?
      puts "Congratulations " + winner + "!"
        else
          puts "Cats Game!"
  end
 end
end 
end
