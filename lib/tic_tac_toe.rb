class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
 WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(userinput)
    userinput = userinput.to_i
    userinput - 1
  end
  
  def move(userinput, character)
    @board[userinput] = character
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if position_taken?(index) == true; false
    elsif index > 9 || index < 0; false
    else; true
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
def turn
        # ask for input
    puts "Please enter 1-9:"
        # get input
    index = gets.strip
        # convert input to index
    indexNum = input_to_index(index)
        # if index is valid
    if valid_move?(indexNum)
      move(indexNum, current_player)
      display_board
    else
      turn
    end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    position_1 = @board[combo[0]]
    position_2 = @board[combo[1]]
    position_3 = @board[combo[2]]
    if position_1 == position_2 && position_2 == position_3 && position_taken?(combo[0])
      return combo 
    end
  end
  false
end

def full?
  @board.none? { |openMoves| openMoves == " "} 
end

def draw?
    full? && !won?
end

def over?
  if won? || full? || draw?
    return true
  end
end

def winner
  if won?
    @board[won?[0]]
  end
end

def play
  until over?
    turn
  end
   if won?
    winningPlayer = winner
    puts "Congratulations #{winningPlayer}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end