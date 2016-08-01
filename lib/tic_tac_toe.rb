class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],  # Top row win
    [3,4,5],  # Middle row win
    [6,7,8],  # Bottom row win
    [0,3,6],  # Left vertical win
    [1,4,7],  # Middle vertical win
    [2,5,8],  # right vertical win
    [0,4,8],  # Left diagonal win
    [2,4,6] # right diagonal win
  ]
 def initialize()
   @board = Array.new(9, " ")
 end

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def move(location, token)
   @board[location.to_i-1] = token
 end

def position_taken?(position)
!(@board[position] ==" " || @board[position] =="" || @board[position] ==nil)
end

def valid_move?(position)
position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def input_to_index(user_input)
user_input.to_i - 1
end

def turn
  display_board
  puts "Please enter 1-9:"
  user_input = gets.strip
    if valid_move?(user_input)
    move(user_input, current_player)
    #display_board
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  #checks the win_index on each WIN_COMBINATIONS
  WIN_COMBINATIONS.detect do |win_index|
    #checks if win_index on board index are all X or all O
    if win_index.all?{|index| @board[index] == "X"} || win_index.all?{|index| @board[index] == "O"}
      #returns the winning combination (win_index)
      return win_index
    else
      #returns NOT won if no winning combination on board
      win_index.all?{|index| @board[index] == " "}
    end
  end
  nil
end

def full?
  #checks if board is NOT empty
  if !@board.include?(" ")
    true
  else
    false
  end
end

def draw?
  #checks if game is NOT won AND game is full
  if !won? && full?
    true
  else
    #checks if game is NOT won AND game is NOT full
    !won? && !full?
    false
  end

end

def over?
  #checks if game is won OR game is a draw
  if won? || draw?
    true
  else
    false
  end
end

def winner
  #gets win_combo from board that is won
	win_combo = won?
  #if win_combo does not equal nil
   if win_combo != nil
     #index = first array in win_combo out of the 3
     index=win_combo[0]
     #returns either X or O from the board index
      @board[index]
   else
     return nil
    end
  end

  def play
    #Is game over?
    while !over?
      #Take turns
        turn
    end
      #Is game won?
      if won?
      #Congratulate winner
        puts "Congratulations #{winner}!"
      elsif
      #Game is a draw
        puts "Cats Game!"
    end
  end
end
