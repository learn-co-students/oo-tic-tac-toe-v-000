class TicTacToe
  
 def initialize
   @board = [" ", " " , " ", " ", " " , " ", " ", " " , " "]
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
  
def board=(board)
  @board = board
end

def board
  @board
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

def move(index, current_player = "X")
  @board[index] = current_player
 end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && position_taken?(index) == false
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)

    current_player_v = current_player
    move(index, current_player_v)
    display_board
  else
    turn

  end
end

def turn_count
  turn = 0
  @board.each do |position|
    if position == "X" || position == "O"
      turn += 1
    end
  end
  return turn
end


def current_player
  turn = turn_count
  if turn % 2 == 0 
    return "X"
  else
    return "O"
  end
end

def won?
  winner = false
  who_won = nil
  WIN_COMBINATIONS.each do |current_combination|
    if @board[current_combination[0]] == "X" && @board[current_combination[1]] == "X" && @board[current_combination[2]] == "X"
      winner = current_combination
      who_won = "X"
    elsif @board[current_combination[0]] == "O" && @board[current_combination[1]] == "O" && @board[current_combination[2]] == "O"
      winner = current_combination
      who_won = "O"
    end
  end
  return winner
end
    
def full?
 @board.none?{|blank_space| blank_space == " "} 
end

def draw?
  if full? == true && won? == false
  return true
  else 
    return false
  end
end  
  
def over?
  if full? == true || won? != false || draw? == true

    return true
  else return false
end
end

def winner
winner = false
  who_won = nil
  WIN_COMBINATIONS.each do |current_combination|
    if @board[current_combination[0]] == "X" && @board[current_combination[1]] == "X" && @board[current_combination[2]] == "X"
      winner = current_combination
      who_won = "X"
    elsif @board[current_combination[0]] == "O" && @board[current_combination[1]] == "O" && @board[current_combination[2]] == "O"
      winner = current_combination
      who_won = "O"
    end
  end
  return who_won
end

def play

 while over? != true
   if draw? != true
  turn
   elsif draw? == true
     puts "Cat's Game!"
  end

  end
  if over? == true
    if winner == "O"
    puts "Congratulations O!"
    elsif winner == "X"
    puts "Congratulations X!"

    elsif draw? == true
      puts "Cat's Game!"

end
end
end
end