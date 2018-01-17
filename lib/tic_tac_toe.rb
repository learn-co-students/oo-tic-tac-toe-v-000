class TicTacToe

def initialize(board = nil)
    @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [
   [0,1,2],  # Top row
   [3,4,5],  # Middle row
   [6,7,8],  # Bottom row
   [0,4,8],  # Left diagonal
   [6,4,2],  # Right diagonal
   [0,3,6],  # Right vertical
   [1,4,7],  # Middle vertical
   [2,5,8]   # Right vertical
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

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if
    valid_move?(index)
    move(index, current_player)
  display_board
  else
    turn
  end
end

def turn_count
  count = 0
  @board.each do |index|
    if index != " "
      count += 1
    end
  end
    count
 end

 def current_player
   if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS .each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
            return combination
          end
          if @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
            return combination
    end
  end
    false
  end

  def full?
  @board.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
  won? || draw?

  end

  def winner
    if (draw? || !full? && !won?)
      return nil
    elsif (@board[won?[0]] == "X")
      return "X"
    elsif (@board[won?[0]] == "O")
      return "O"
    end
  end

  def play
    while !over? && !won? && !draw?
      turn
    end


    if won?
     puts "Congratulations #{winner}!"
   end


   if draw?
     puts "Cat's Game!"
   end
end

end
