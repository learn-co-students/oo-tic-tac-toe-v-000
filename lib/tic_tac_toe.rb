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
  
def input_to_index(input)
    input.to_i - 1
end 
 
 def move(index,token) 
    @board[index]=token
  end

def position_taken?(input_to_index)
  (@board[input_to_index]) == "X" || (@board[input_to_index]) == "O"
end


def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end 
  

def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else 
      turn 
    end 
  end 
       
   def turn_count
  counter = 0
  @board.each do |move| 
    if move == "X" || move == "O"
      counter += 1 
      end 
  end 
  return counter 
end 
  
def current_player
  if turn_count%2 == 0
    current_player = "X"
  else 
    current_player = "O"
  end 
  return current_player
end 

def won? 
  WIN_COMBINATIONS.detect do |win_combo| 
    if (@board[win_combo[0]] == "X") && 
        (@board[win_combo[1]] == "X") && 
         (@board[win_combo[2]] == "X")
         return win_combo
       elsif (@board[win_combo[0]] == "O") && 
              (@board[win_combo[1]] == "O") && 
                (@board[win_combo[2]] == "O")
                return win_combo
              end 
              false 
            end 
          end 
          
    def full?
  @board.all?{|occupied| occupied != " "}
end      
  
 def draw?
   if !won? && full? 
     puts "the game has been won"
     return true 
   else 
     puts "the game has not been won"
     return false 
   end 
 end 
 
 def over? 
   won? || full? || draw? 
 end 
 
 def winner
    if winner = won?
      @board[winner.first]
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