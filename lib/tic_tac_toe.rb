class TicTacToe
    
def initialize(board = nil)
    @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [
    [0,1,2], #Horizontal/Top row
    [3,4,5], #Horizontal/Middle row 
    [6,7,8], #Horizontal/Bottom row
    [0,3,6], #Vertical/First Row
    [1,4,7], #Vertical/Second Row
    [2,5,8], #Vertical/Third Row
    [0,4,8], #Diagonal/Upper left
    [2,4,6]  #Diagonal/Upper right
    ]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
    "#{input}".to_i - 1
end

def move(index, value)
  @board[index] = value
end

def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
        false
    elsif @board[index] == "X" || @board[index] == "O"
        true
    end
end

def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
        true
    else
        false 
    end
end

def turn_count
    @board.count{|token| token == "X" || token == "O"}
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  valid_move = valid_move?(index)
  if valid_move
    move(index,current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
        if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
            return combo    
        elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
            return combo
        end
        false
    end
end

def full?
    @board.all?{|token| token == "X" || token == "O"}
end  

def draw?
    if !won? && full?
        true
    end
end

def over?
    if won? || draw? || full?
    true
    end  
end
    
def winner
     WIN_COMBINATIONS.detect do |combo|
        if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
            return "X"    
        elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
            return "O"
        end
        nil
    end
end

def play
    until over?
     turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
end

end