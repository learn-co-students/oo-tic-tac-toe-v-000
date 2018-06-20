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
  
#input_to_index

  def input_to_index(user_input)
    user_input.to_i - 1
    end 
    
#move - places character in board index given by the arguments

  def move(input_to_index, character = "X")
    @board[input_to_index] = character
  end 
  
# position_taken (less verbose) -checks to see whether that index on board is taken or not
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  
#valid_move

  def valid_move?(input_to_index)
    if (input_to_index.between?(0,8) == true && !position_taken?(input_to_index) == true)
     return true
    else return false 
    end  
  end


# turn will repeat loop to ask for input until condition of valid move = true
# Asking the user for their move by position 1-9.Receiving the user input.Convert position to an index.If the move is valid, make the move and display the board to the user.If the move is invalid, ask for a new move until a valid move is received.

#turn
  def turn
    puts "Please enter a number between 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      character = current_player
      move(index, character)
      display_board
     else 
       puts "Whoops! That's not a valid move"
       turn 
    end
  end


#turn_count

  def turn_count
    @board.count {|position| position !=" "}
  end

#current_player

  def current_player
    if turn_count.even?
      return "X"
    else return "O"
    end
  end

#won 
  def won?
      WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end 


#full - return false if there is one position open " "
def full?
  @board.each do |taken| 
  if taken == " "
    return false
  end
 end
end  


#true if the board has not been won and is full  - !won?(board) && full? // need to treat the second condition seperately - ie. the ! cannot apply to the full?

#draw 
def draw?
  !won? && full?
end
  


#over -returns true if board has been won, draw or is full
def over?
  won? || draw? || full?
end 


#winner -return the token, "X" or "O" that has won

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

#play
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


    
end
