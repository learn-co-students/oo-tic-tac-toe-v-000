class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [

  [0,1,2],  #Top Row Combo
  [3,4,5],  #Middle Row Combo
  [6,7,8],  #Bottom Row Combo
  [0,3,6],  #Left Row Combo
  [1,4,7],  #Middle Row Combo
  [2,5,8],  #Right Row Combo
  [0,4,8],  #Left Diag Combo
  [2,4,6]   #Right Diag Combo
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

def move(index, token = "X")
  @board[index] = token
end
def position_taken?(index)
  if @board[index] == "" || @board[index] == " " || @board[index] == nil
  return false

else 
  return true
end
end

def valid_move?(index)
  if index.between?(0, 8) && position_taken?(index) == false
    return true
    
  else
    return false
     end
end

  def turn
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if index.between?(0, 8) == false || valid_move?(index) == false
    turn   
  else
      move(index, token = "X")
      display_board
      
    end
    
    
end
  def turn_count
  turns = 0
  @board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end
end 
