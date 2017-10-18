WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], #Top
    [0, 3, 6], [1, 4, 7], [2, 5, 8], #vertical - array 1
    [0, 4, 8], [2, 4, 6], #diagnol - array 2
]

class TicTacToe
  def initialize(board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] || Array.new(9, " ")

  end


def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def valid_move?(index)
        if index.between?(0,8) && !position_taken?(index)
          return true
        else
      end
  end

  def turn
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)


if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
    valid_move?(index)
        move(index, current_player)
        display_board
  end
end

   def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def won?
    WIN_COMBINATIONS.detect do |combinations|
      win_index_1 = combinations[0]
      win_index_2 = combinations[1]
      win_index_3 = combinations[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return combinations
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return combinations
         else
          false
        end
      end
    end


  def full?
      @board.all? do |complete|
        complete != " "
    end
  end

  def draw?
    if !won? && full?
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

def turn_count
   counter = 0
   @board.each do |i|
  if i == "X" || i == "O"
   counter += 1
   end
  end
    return counter
  end

  def winner
    if win_combination = won?
      @board[win_combination.first]
  end
end

def play
  until over?
    turn
    current_player
   end
     if won?
      puts "Congratulations #{winner}!"
     else
      puts "Cat's Game!"
    end

end
end
