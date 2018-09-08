class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Right column
    [1,4,7],  # Middle column
    [2,5,8],  # Left column
    [0,4,8],  # Left diagonal
    [2,4,6]  # Right diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i
    user_input = user_input -= 1
  return user_input
end

def move(index, character = "X")
  @board[index] = character
  return @board
end

def position_taken?(index)
  if (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
    false
  elsif (@board[index] == "X"|| @board[index] == "O")
    true
end
end

def valid_move?(index)
  if index.between?(0,8) && !(position_taken?(index))
    true
  else
    false
  end
end

def turn_count
  counter = 0
  @board.each do |token|
    if token == "X" || token == "O"
      counter +=1
    end
  end
  counter
end

def current_player
  if turn_count.even?
    player = "X"
  else
    player = "O"
return player
end
end

def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
end

 def won?
     board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
  end
end

 def full?
   @board.all? { |i| i =="X" || i == "O"}
 end

   def draw?
    !won? && full? ? true : false
  end

  def over?
     won? || draw? || full? ? true : false
   end

    def winner
     WIN_COMBINATIONS.detect do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
          return "X"
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return "O"
        else
          nil
        end
     end
   end

   def play
     while over? == false
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end
   end

end
