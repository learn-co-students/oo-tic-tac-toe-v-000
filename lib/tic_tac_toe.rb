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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, player_token ="X")
  @board[index] = player_token
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    return true
  else
    return false
  end
end

def valid_move?(index)
  if @board[index] == " " && index.between?(0, 8)
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  count = 0
  @board.each do |space|
    if "#{space}" != " "
      count +=1
      puts count
    end
  end
  count
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    position_1 = @board[win_combo[0]]
    position_2 = @board[win_combo[1]]
    position_3 = @board[win_combo[2]]

    position_1 == position_2 &&
    position_2 == position_3 &&

    position_taken?(win_combo[0])
  end
end

def full?
    @board.all? do |space|
    space != " "
    end
end

def draw?
  full? && !won?
end

def over?
  draw? || won?
end

def winner
  if won? != nil
    integer = won?[0]
    return @board[integer]
  else
    nil
  end
end

def play
  until over?
    turn
end
  if full? && !won?
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner}!"
  end
end

end
