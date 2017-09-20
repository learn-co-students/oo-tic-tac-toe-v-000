class TicTacToe

  def initialize (board = nil)
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
    [6,4,2],
    ]

  def display_board
      lineOne = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      lineTwo = "-----------"
      lineThree = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      lineFour = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      puts lineOne
      puts lineTwo
      puts lineThree
      puts lineTwo
      puts lineFour
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true
  else
    false
  end
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
  else
    turn
  end
  display_board
end

def turn_count
  @board.count {|token| token == "X" || token == "O" }
end

def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
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
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?
  space = " "
  if @board.include?(space)
    return false
  else
    return true
  end
end

def draw?
if won? == false && full? == true
  return true
else
  return false
end
end

def over?
if won? != false || draw? == true || full? == true
  return true
else
  return false
end
end

def winner
  if win = won?
    @board[win.first]
    end
  end

def play
until over?
  turn
end
if won?
  puts "Congratulations #{winner}!"
else draw?
  puts "Cat's Game!"
end
end
end
