
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


   WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # middle row
  [6,7,8],  # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8],
  [6,4,2],
   ]

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end



   def input_to_index(input)
     index = input.to_i-1
  end

  def move(index, current_player)
    #index = input_to_index(index)
    @board[index] = current_player
    end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
    end


  def valid_move?(index)
    #index = input.to_i-1
    index.between?(0,8) && !position_taken?(index)
    end

  def turn_count
   counter = 0
  @board.each do |turn|
   if turn == "X" || turn == "O"
   counter += 1
  end
 end
  return counter
   end

   def current_player

    if turn_count % 2 == 0
      return "X"
    else turn_count % 2 == 1
      return "O"
    end
  end

  def turn
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


  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
    end
  end
  false
end

  def full?
    @board.all? {|index| index == "X" || index == "O"}
    end

  def draw?
  if !won? && full?
    return true
  else
    return false
  end
end


def over?
  if won?
    return true
  elsif draw?
    return true
  elsif full?
    return true
  else
    return false
  end
end


def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end


def play
  until over?
    turn
  end
   if won?
     winning_token = winner
     puts "Congratulations #{winning_token}!"
  elsif draw?
    puts "Cat's Game!"
   end
  end
 end
