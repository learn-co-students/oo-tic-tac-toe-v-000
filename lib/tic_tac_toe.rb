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
  [2,4,6],
  ]
  
  def input_to_index(i)
  i = i.to_i
  i = i - 1
end

def move(j, character)
  @board[j] = "#{character}"
end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def position_taken?(x)
  if @board[x] == " "
    return false 
 return false
 elsif @board[x] == ""
 return false
  elsif @board[x] == "X" || @board[x] == "O"
    return true 
  else 
    return false
  end
end

def valid_move?(x)
  if x < 0 || x > 8 
    return false
  end
  if @board[x] == " "
    return true
 elsif @board[x] == ""
    return true
  elsif @board[x] == "X" || @board[x] == "O"
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  q = gets.strip
  r = input_to_index(q)
  s = valid_move?(r)
  if s == true
    @board[r] = current_player
    display_board
  elsif !s 
  turn
  end
end

def won?
    WIN_COMBINATIONS.each do |combo|
      a = combo[0]
      b = combo[1]
      c = combo[2]
      if @board[a] == @board[b] && @board[b] == @board[c] && @board[a] != " "
        return combo
      end
    end
    false
    end

def full?
      if won? == false && @board[0] != " " && @board[1] != " " && @board[2] != " " && @board[3] != " " && @board[4] != " " && @board[5] != " " && @board[6] != " " && @board[7] != " " && @board[8] != " "
        return true 
   end
 end
 
 def draw?
   if !full?
     return false
   elsif !won? 
        return true 
   end
 end
 
 def over?
   if won?
     return true
     elsif draw?
     return true
   elsif won? == false && draw? == false
     return false
   end
 end
 
 def winner
  x = won?
 if x == false
     return nil
else 
  @board[won?[0]]
end
end


def play
  while !over?
  turn
end
if won?
puts "Congratulations #{winner}!"
elsif draw?
puts "Cat's Game!"
end
end
end