class TicTacToe

  def initialize(board = nil)
   @board = board || Array.new(9, " ")
  end

    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

def move(location, current_player = "X")
  @board[location.to_i-1] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  if position.to_i.between?(1,9) && position_taken?(position.to_i-1) == false
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.chomp
  if valid_move?(position) == true
    move(position)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 1
  @board.each do |xo|
    if xo == "X" || xo == "0"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else 
    return "0"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]


    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif
        position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?

  if @board.none?{|i| i == " "}
    return true
  else false
  end
end

def draw?
  if won? == false && full? == true
    return true
  elsif won? == false && full? == false
      return false
  elsif won? == true
      return true
  end
end

def over?
  if won? || draw? || full?
    return true
  else 
    false
  end
end

def winner
  if won? != false
    combo = won?
    number = combo[0]
    return @board[number]
  end
end

def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{current_player}"
  elsif draw?
     puts "Cat's Game!"
  end
end

end