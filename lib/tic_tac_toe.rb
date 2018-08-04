class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
 
 def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  taken  = nil
  if @board[index] ==  " " || @board[index] == "" || @board[index] == nil
    taken = false
  else
    taken = true
  end
  return taken
end 

def valid_move?(index)
  if index.between?(0, 8)
    if !position_taken?(index)
      true
    end 
  end 
end 

def turn_count()
  @turns = 0
  @board.each do |token|
    if token == "X" || token == "O"
      @turns += 1
    end
  end
  @turns
 end

def current_player()
  turn_count() % 2 == 0 ? "X" : "O"
end


def turn()
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  current_player = current_player()
  if valid_move?(index)
    move(index, current_player)
    display_board()
  else 
    turn()
  end 
end 
  
def won?()
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all?{|win_index| @board[win_index] == "X"}
      return win_combo
    elsif win_combo.all? {|win_index| @board[win_index] == "O"}
      return win_combo
    end 
  end
  return false
end 
    
def full?()
  @board.all? do |index|
    index == "X" || index == "O"
  end
end 

def draw?()
  if full?() && won?() == false
    TRUE
  end 
end 

def over?()
  if won?() != false || draw?()
    TRUE
  end
end

def winner()
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all?{|win_index| @board[win_index] == "X"}
      return "X"
    elsif win_combo.all? {|win_index| @board[win_index] == "O"}
      return "O"
    end 
  end
  return nil
end 

def play()
  until over?() do
    turn()
  end 
    if won?()
      champion = winner()
      puts "Congratulations #{champion}!"
    else if draw?()
      puts "Cat's Game!"
    end  
  end 
end 


end 