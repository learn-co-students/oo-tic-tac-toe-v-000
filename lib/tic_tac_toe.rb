class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
      @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
      user_input.to_i - 1
  end

  def move(index, symbol)
      @board[index] = symbol
  end

  def position_taken?(index)
      if @board[index] == "X" || @board[index] == "O"
        true
      elsif @board[index] == "" || @board[index] == nil || @board[index] == " "
        false
      end
  end

  def valid_move?(index)
      if index.between?(0,8) && @board[index] == " "
        true
      elsif @board[index] == "X" || @board[index] == "O"
        false
      end
  end

  def turn_count
    @board.count{|token| token != " "}
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
    user_input = gets
    index = input_to_index(user_input)
    puts "Please enter 1-9:"
    if valid_move?(index)
      symbol = current_player
      move(index, symbol)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = win_combination[0]
      position_2 = win_combination[1]
      position_3 = win_combination[2]
      if position_taken?(position_1) && @board[position_1] == @board[position_2] && @board[position_3] == @board[position_1]
        return win_combination
      end
  end
  return false
end

def full?
  @board.all? {|token| token != " "}
end

def draw?
  if won?
    return false
  end
  if full?
    return true
  end
  @board.each do |token|
    if token != "X" || token != "O"
      return false
    end
  end
    true
end

def over?
  if full?
    print "In full"
    return true
  end
  if draw?
    print "In draw"
    return true
  end
  if won?
    print "In won"
    return true
  end
  false
end

def winner
  if winning_combo = won?
    @board[winning_combo[0]]
  end
end

def play
  current_player
  while over? != true
    turn
  end
  if winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
