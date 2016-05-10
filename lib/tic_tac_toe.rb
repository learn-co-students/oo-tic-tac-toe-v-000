class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def move(position, player_token)
  @board[position.to_i - 1] = player_token
end

def position_taken?(position)
  if @board[position.to_i] == " " || @board[position.to_i] == "" || @board[position.to_i] == nil
    false
  else
    true
  end
end

def valid_move?(position)
  if position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position, current_player)
    display_board
  else !valid_move?(position)
    turn
  end
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

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  false
end

def full?
  if @board.none? {|i| i == " "}
    return true
  else
    false
  end
end

def draw?
  if !won? && full?
    return true
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
  if won? != false
    won_game = won?
    player = won_game[0]
    return @board[player]
  end
end

def play
  until over? || won?
    turn
    end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cats Game!"
  end
end

end
