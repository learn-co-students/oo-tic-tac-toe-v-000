class TicTacToe

def initialize(board = nil)
    @board = board || Array.new(9," ")

end

WIN_COMBINATIONS =[
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

def input_to_index(input)
  @input = input.to_i - 1
end

def move(input, token = "X")
@token = token
  @board [input] = token
end



def position_taken?(input)
  if @board[input] == "X"
    true
  elsif @board[input] == "O"
    true
  else
    false
  end
end

def valid_move?(input)
  input.between?(0,8) && !position_taken?(input)

end


def turn_count
  counter = 0
  @board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def turn
  puts "Please enter 1-9"
  input = gets.strip
  input = input_to_index(input)
  if valid_move?(input)
    move(input,current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
end

def full?
  @board.each do |positions|
    if positions == " "
      return false
    else
      true
    end
  end
end

def draw?
  if full? && !won?
    return true
  else
    false
  end
end

def over?
  if draw? || won?
    return true
  else
    false
  end
end

def winner
  if win_combination = won?
    @board[win_combination[0]]
  end
end

def play
  until over? 
    turn
  end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"

  end
end

end
