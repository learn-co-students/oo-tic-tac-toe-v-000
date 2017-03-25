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
  separator = "-----------"
  line_1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  line_2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  line_3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  puts line_1
  puts separator
  puts line_2
  puts separator
  puts line_3
end

def input_to_index(string)
  index = string.to_i - 1
end

def move(index, value = "X")
  @board[index] = value
end

def position_taken?(index)
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    return false
  elsif (@board[index] == "X" || @board[index] == "O")
    return true
  end
end

def valid_move?(index)
  if (index.between?(0, 8) && position_taken?(index) == false)
    return true
  else
    return false
  end
end

def turn_count
  turn = 0
  @board.each do |space|
    if space == "X" || space == "O"
      turn +=1
    end
  end
  return turn
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if (valid_move?(index))
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.find do |win|
    @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
  end
end

def full?
  @board.all?{|space| space == "X" || space == "O"}
end

def draw?
  !(won?) && full? ? true : false
end

def over?
  won? || full? || draw?
end

def winner
  if winning = won?
    @board[winning[0]]
  end
end

def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end