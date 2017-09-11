class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS =
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @index = user_input.to_i - 1
  end

  def move(index, char = 'X')
    @board[index] = char
    return @board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.to_i.between?(0, 8) == true && @board[index] == " " || @board[index] == ""
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp
    input_to_index(user_input)
    index = user_input.to_i - 1
    if valid_move?(index)
      move(index, char = current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter +=1
      end
    end
    return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
       combination.all?{|index| @board[index] == "X"} || combination.all?{|index| @board[index] == "O"}
    end
  end

  def full?
    @board.none? do |space|
      space == " "
    end
  end


  def draw?
    if full? && !(won?)
      true
    else
      false
    end
  end

def over?
  if won? || full? || draw?
    true
  else
    false
  end
end

  def winner
    WIN_COMBINATIONS.detect do |combination|
      if combination.all?{|index| @board[index] == "X"}
        return "X"
      elsif combination.all?{|index| @board[index] == "O"}
        return "O"
      else
        nil
      end
    end
  end

  def play
   until over?
     current_player
     turn
   end
   if won?
     if winner == "X"
       puts "Congratulations X!"
     else
       puts "Congratulations O!"
     end
   else
     puts "Cat's Game!"
   end
  end
end
