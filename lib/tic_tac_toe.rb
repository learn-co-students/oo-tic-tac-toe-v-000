class TicTacToe

  def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

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

  def move(index, default_player = "X")
    @board[index] = default_player
  end

  def valid_move?(index)
    if !position_taken?(index) && (index).between?(0, 8) == true
      return true
    else false
    end
  end


  def position_taken?(index)
        !(@board[index].nil? || @board[index] == " " || @board[index] == "")
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
      if turn_count.even?
        return "X"
      else turn_count.odd?
        return "O"
      end
    end

    def turn
        puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if !valid_move?(index)
        turn
      else move(index, current_player)
        display_board
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
  if @board.detect {|i| i == " " || i = nil}
  return false
else
  true
end
end

def draw?
  if !won? && full?
  return true
else
  return
  false
end
end

def over?
  if won? || draw? || full?
    return true
  else false
end
end

def winner
  if win_combination = won?
    @board[win_combination.first]
end
end

def play
until over? == true
  turn
end
if draw? == true
  puts "Cat's Game!"
else won?
  puts "Congratulations #{winner}!"
end
end

end
