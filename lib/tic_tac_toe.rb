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
  [6,4,2]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move (location, player_character = "X")
  @board[location.to_i-1] = player_character
end

def position_taken?(position)
  if @board[position.to_i] == " " || @board[position.to_i] == "" || @board[position.to_i] == nil
    false
  else
    true
  end
end

def valid_move?(position)
  if position.to_i.between?(1, 9) && !position_taken?(position.to_i-1)
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
    return position
  else 
      position.to_i.between?(1,9) ==true
      turn 
  end
end

def turn_count
  count = 0
    @board.each do |position|
    if "#{position}" == "X" || "#{position}" == "O"
    count += 1 
    end
  end
  return count
  end


def current_player
  if turn_count % 2 == 0
    "X"
  else 
    "O" 
  end 
end

def won?
  WIN_COMBINATIONS.each do |win_combo|
    if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") ||
       (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
      return win_combo
      end
    end
    nil
end

def full?
  !@board.detect do |pos|
    pos == " "
  end 
end

  def draw?
    if won? || !full?
      false
    else
      true
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
  if won?
    return @board[won?[0]]
  else
    nil
  end
end

  def play
    until over?
      turn
    end
     if won?
       winner
          puts "Congratulations #{winner}!"
      else draw?
       puts "Cats Game!"
      end
  end
end
