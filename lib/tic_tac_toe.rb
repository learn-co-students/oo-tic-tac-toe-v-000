class TicTacToe

  def initialize
    @board = board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
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

def move(location, player="X")
  @location = location
  @index = location.to_i - 1
  @player = player
  @board[@index] = @player
end

def position_taken?(location)
  puts "running position_taken"
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(location)
  input = location.to_i
  input -= 1
  if ((position_taken?(input)) || !(input.between?(0,8)))
    false
  else
    true
  end
end

def turn
  display_board
  player = current_player
  puts "Player #{player}, please enter your move:"
  input = gets.chomp
  if valid_move?(input) then
    move(input, player)
  else
    puts "invalid"
    turn
  end
end

def current_player
  player = turn_count.even? ? 'X' : 'O'
  return player
end

def turn_count
  counter = 0
  @board.each do |contents|
    if contents != ' '
      counter += 1
    end
  end
  return counter
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    # puts "win_combination is #{win_combination}"
    win_check = [@board[win_combination[0]], @board[win_combination[1]], @board[win_combination[2]]]
    # puts "win_check is #{win_check}"
    if win_check.all? {|player| player == 'O'} then
        # puts "evaluated true; winner O"
        win_player = "O"
        return win_combination
    elsif win_check.all? {|player| player == 'X'} then
        # puts "evaluated true; winner X"
        win_player = "X"
        return win_combination
    else
        # puts "evaluated false"
    end
  end
  return false
end

def full?
  if @board.include?(" ") then
    return false
  else
    return true
  end
end

def draw?
  if ((!(won?)) && (full?)) then
    return true
  else
    return false
  end
end

def over?
  if ((full? != false) || (won?) || (draw?)) then
    return true
  else
    return false
  end
end

def winner
  win_combination = won?
  if won? then
    return @board[win_combination[0]]
  else
    return nil
  end
end

def play
  until over?
    turn
  end
  if won? then
    winning_player = winner
    puts "Congratulations #{winning_player}!"
  else
    puts "Cats Game!"
  end
end

end
