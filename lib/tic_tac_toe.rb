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
  [0,4,8],
  [2,4,6]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, token = "X")
    @board[index.to_i - 1] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !position_taken?(index.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index)
      move(index, current_player)
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
    WIN_COMBINATIONS.find do |win_combo|
    if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
      return win_combo
    elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
      return win_combo
    end
  end
end

def full?
  @board.all? do |full_board|
    full_board == "X" || full_board == "O"
  end
end

def draw?
   !won? && full?
end

def over?
  won? || full? || draw?
end

def winner
  WIN_COMBINATIONS.find do |win_combo|
    if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
      return "X"
    elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
      return "O"
    end
  end
end

def play
  turn until over?
    if over? && winner == "X"
      puts "Congratulations X!"
    elsif over? && winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cats Game!"
    end
 end
end

#Making the winner method alter an instance variable that can be accessed by play.
