class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9," ")
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
  
  def input_to_index (user_input)
    user_input.to_i-1
  end
    
    def move(index, player)
      @board[index] = player
    end
    
    def position_taken?(index)
    ((@board[index] == "X") || (@board[index] == "O"))
    end

def valid_move? (index)
    index.between?(0,8) && !position_taken?(index)
 end

def turn
  puts "Please enter 1-9."
  input = gets.strip
  index = input_to_index(input)
  player = current_player
  if valid_move?(index)
    move(index,player)
    display_board
  else 
    turn
  end
end

def turn_count
  # board.count{|token| token == "X" || token == "O"}
  turn = 0
  @board.each do |p| 
    if p != " "
      turn += 1
    end
  end
turn
end

def current_player
  if turn_count.even?
    "X"
  else
    "O"
  end
end


def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      nil
    end
  end
end

def full?
  if @board.detect {|p| p == " " || p == nil}
    return FALSE
  else
    return TRUE
  end
end

def draw?
  if !won? && full?
    return TRUE
  else
    return FALSE
  end
end
  
def over?
  if won? || draw?
    return TRUE
  else
    return FALSE
  end
end
    
def winner
  if won?
    @board[won?[0]]
  else !won?
    nil
  end
end


def play
  until over? == TRUE
  turn
end
 if won? 
   puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end

