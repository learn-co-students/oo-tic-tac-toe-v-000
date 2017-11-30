class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end 


def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
end  

def position_taken?(index)
  if  (@board[index] == "") || (@board[index] == " ") || (@board[index] == nil)
    return false
  elsif (@board[index] != "") || (@board[index] != " ") ||(@board[index] != nil)
    return true
  end
end 

def input_to_index(input)
  index = input.to_i - 1 
end

def move(index, character = "X")
  @board[index] = character 
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

def play
  until over?
    turn
   end 
   if draw?
    puts "Cat's Game!"
  elsif won?
    puts "Congratulations #{winner}!"
end
end

def turn_count
  counter = 0
  @board.each do |space|
    if space != " "
      counter += 1 
    end
  end
  return counter
end

def current_player
    if turn_count.odd? 
      return "O"
    elsif turn_count.even?
      return "X"
    end
end

 def won?
    WIN_COMBINATIONS.any? do |combo|
          if @board[combo[0]] == "X" && 
          @board[combo[1]] == "X" && 
          @board[combo[2]] == "X" || 
          @board[combo[0]] == "O" && 
          @board[combo[1]] == "O" && 
          @board[combo[2]] == "O"
          return combo
          end
      end
  end 
  
def full?
  @board.none? do |index|
     index == " "
  end
end 

def draw?
  full? && !won?
end
  
def over?
  full? || won? || draw? 
end

def winner
    if won?
       winning_line = won?
       return @board[winning_line[0]]
    end
end
end