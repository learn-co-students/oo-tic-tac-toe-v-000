class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
   [0,1,2],
   [0,3,6],
   [2,4,6],
   [3,4,5],
   [1,4,7],
   [0,4,8],
   [6,7,8],
   [2,5,8]
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
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  if index > -1 && index < 9 && position_taken?(index) == false
    true
  end
end

def turn_count
  turns = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      turns += 1
    end
  end
  turns
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(index) == true
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
end

def won?
  WIN_COMBINATIONS.find do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] &&
    @board[win_combination[1]] == @board[win_combination[2]] &&
    position_taken?(win_combination[0])
  end
end

def full?
  @board.none? {|index| index == " "}
end

def draw?
  full? == true && won? == nil
end

def over?
  draw? == true || won? != nil
end

def winner
  if won? != nil
    winner = @board[won?[0]]
  end
  winner
end

def play
  while over? == false
    turn
    won?
    draw?
  end
  won?
  if won?
    puts "Congratulations #{winner}!"
  end
  if draw?
    puts "Cat's Game!"
  end 
end


end
