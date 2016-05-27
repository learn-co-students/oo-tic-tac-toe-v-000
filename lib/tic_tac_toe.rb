class TicTacToe
  def initialize (board = nil)
   @board = board || Array.new(9, " ")
  end  

  def board
    @board
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
  puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts"-----------"
  puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts"-----------"
  puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
end  

def move(input, value = "X")
  @place = input -1 
  @board[@place] = value
  
end

def position_taken?(position)
  !(@board[position].nil? || @board[position] == " " || @board[position] == "" )
end



def valid_move?(position)
  position = position.to_i - 1
  if 
    position <0 || position >8
    false
  elsif position_taken?(position) == false
    true
  elsif
    position_taken?(position) == true
    false
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  num_input = gets
  position = num_input.to_i
  if valid_move?(position) == false

 turn
  else
   move(position, current_player)
   display_board

  end
  
end

def turn_count
  counter = 0
  @board.each do |position|
      if position == "O" || position == "X"
        counter += 1
      else 
        counter = counter
      end
    end
return counter
  
end

def current_player
  if turn_count % 2 ==0
    then "X"
  else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.any? do |combo|
    position0 = @board[combo[0]]
    position1 = @board[combo[1]]
    position2 = @board[combo[2]]
      if (position0 == "X" && position1 == "X" && position2 == "X") || (position0 == "O" && position1 == "O" && position2 == "O") 
        return combo

      else
        false
      end

  end
end

def full?
  @board.all? do |position|
    if position == "X" || position == "O"
      true
    else
      false
    end   
  end   
end  

def draw?
  if !won? && full?
    true
  else
    false  
  end
end  

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end  

def winner
  if !won?
    return nil
  else 
    return @board[won?[0]]
  end  
end

def play

  until over? 
     turn
  end

if won?
   puts  "Congratulations #{winner}!"
elsif draw?
  puts "Cats Game!"
end

end



end  