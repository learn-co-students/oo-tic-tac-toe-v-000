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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player="X")
  @board[index] = current_player
end

def position_taken?(location)
  if @board[location] != " " && @board[location] != ""
    true
  else
    false
  end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end


def turn_count
  turn_number = 0
  @board.each do |space|
    if space == "X" || space == "O"
      turn_number += 1
    end
  end
  turn_number
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(index) == true
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
      position1 = @board[win_combo[0]]
      position2 = @board[win_combo[1]]
      position3 = @board[win_combo[2]]
      if (position1 == position2 && position2 == position3) && position_taken?(win_combo[0])
        return win_combo
      end
  end
end

def full?
  !@board.include?(" ")
end

def draw?
  if !won? && full?
    true
  end
end

def over?
  if won? || full? || draw?
    true
  end
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

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
