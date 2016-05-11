class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

WIN_COMBINATIONS = [
  [0,1,2],  #0
  [3,4,5],  #1
  [6,7,8],  #2
  [0,3,6],  #3
  [1,4,7],  #4
  [2,5,8],  #5
  [0,4,8],  #6
  [2,4,6]   #7
]


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def move(input, char)# code your move method here!
  @board[input.to_i - 1] = char  # board[] has the character X
end


def position_taken?(position)
  if @board[position] == "" || @board[position] == " "
    false
  elsif @board[position] == nil
    false
  elsif @board[position] == "X" || @board[position] == "O"
    true
  end
end


def valid_move?(position)
  if (position.to_i.between?(1, 9) == true) && (position_taken?(position.to_i - 1) == true)
    false
  elsif (position.to_i.between?(1, 9) == false) || (position_taken?(position.to_i - 1) == true)
    false
  elsif (position.to_i.between?(1, 9) == true) && (position_taken?(position.to_i - 1) == false)
    true
  end
end


def turn_count
  counter = 0
  @board.each do |character|
    if (character == "X") || (character == "O")
    counter += 1
    end
  end
  counter
end


def current_player
  if turn_count % 2 == 0
    "X"
  elsif turn_count == 1
    "O"
  elsif turn_count == 0
    "X"
  elsif turn_count % 2 != 0
    "O"
  end
end


def won?
  WIN_COMBINATIONS.each do |combo|
    position1 = @board[combo[0]]
    position2 = @board[combo[1]]
    position3 = @board[combo[2]]
    if ((position1 == "X") && (position2 == "X") && (position3 == "X")) ||
       ((position1 == "O") && (position2 == "O") && (position3 == "O"))
       return [combo[0], combo[1], combo[2]]
    end
  end
  false
end


def full?
  @board.all? do |char|
    if (char == "X") || (char == "O")
      true
    else
      false
    end
  end
end


def draw?
  if (won? == true)
    false
  elsif (full? == true) && (won? == false)
    true
  else
    false
  end
end


def over?
  if (won? == true) || (draw? == true) || (full? == true)
    true
  else
    false
  end
end


def winner
  WIN_COMBINATIONS.each do |combo|
    if combo == won?
      return @board[combo[0]]
    end
  end
  nil
end


def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position, current_player)
    display_board
  else
    turn
  end
end


def play
  until (over?) || (won?)
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end
end
