class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
     [0,1,2],  #Top row
    [3,4,5],   #Middle row
    [6,7,8],   #Bottom Row
    [0,3,6],   #Left Column
    [1,4,7],   #Middle Column
    [2,5,8],   #Right Column
    [0,4,8],   #Diagonal 
    [6,4,2]    #Diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "#{current_player}") 
    @board[location.to_i-1] = token
 end

  def position_taken?(location)
   !(@board[location].nil? || @board[location] == " ")
  end
  
  def valid_move?(location)
    if location.to_i.between?(1,9) && !position_taken?(location.to_i-1)
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.any? do |win_combination|
    if (@board[win_combination[0]] == "X" || @board[win_combination[0]] == "O") && @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]]
      win_combination
    end
  end
end

 def full?
  if @board.any? {|spot| spot == " " || spot == nil} 
     return false
   else
    true
   end
 end

def draw?
  if full? == true && won? == false
    return true
  else 
    return false
  end
end

def over?
  if won? == true || draw? == true
    true
  else
    false
  end
end

def winner
  WIN_COMBINATIONS.detect do |winner|
  if @board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X"
    return "X"
  elsif @board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O"
    return "O"
  end
end
end

def play
  until over?
    turn
  end
  if won? == true
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

end




