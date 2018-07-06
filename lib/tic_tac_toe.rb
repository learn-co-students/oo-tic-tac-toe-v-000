class TicTacToe
  def initialize
    @board=[" "," "," "," "," "," "," "," "," "]
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

# Define your WIN_COMBINATIONS constant

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal top-left to bottom-right
    [2,4,6] # Diagonal top-right to bottom-left
  ]

  def won?
    WIN_COMBINATIONS.each do |current_combo|
      position_1 = @board[current_combo[0]]
      position_2 = @board[current_combo[1]]
      position_3 = @board[current_combo[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return current_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return current_combo
      else
        false
      end
    end
    return false
  end

  def full?
    is_full = [0,1,2,3,4,5,6,7,8].all? do |each_space|
      position_taken?(each_space)
    end
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

def over?
  if draw? || won?
    return true
  else
    return false
  end
end

def winner
  winning_combo = won?
  if winning_combo == false || nil
    return nil
  else
    return @board[winning_combo[0]]
  end
end

def turn_count
  count = 0
  @board.each do |this_space|
    if this_space == "X" || this_space == "O"
      count += 1
    end
  end
  return count
end

def current_player
  how_many_turns = turn_count
  how_many_turns % 2 == 0 ? "X" : "O" # ternary operator
end


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

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  #display_board
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

# Define your play method below
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
