class TicTacToe
  def initialize(board = " ")
  @board = board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def TicTacToe
  puts "Welcome to Tic Tac Toe!"
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input = input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    true
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(index)
  move(index, current_player)
  display_board
  else
  puts "invalid move"
  turn
  end
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?
  WIN_COMBINATIONS.each do |win_combination|
   # win_combination == [3,4,5]
  win_index_1 = win_combination[0] # 3
  win_index_2 = win_combination[1] # 4
  win_index_3 = win_combination[2] # 5

  position_1 = @board[win_index_1] #board[3]
  position_2 = @board[win_index_2] #board[4]
  position_3 = @board[win_index_3] #board[5]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
  end
  false
end

def full?
  if @board.include?(" ")
  false
  else
  true
  end
end

def draw?
  if won? == false && full? == true
    true
  else
    false
  end
end

def over?
  won? || draw?
end

def turn_count
  counter = 0
  @board.each do |turns|
    if turns == "X" || turns == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count.to_i.even?
    "X"
  else
    "O"
  end
end

def winner
  if won?
  if @board[won?[0]] == "X"
    "X"
  elsif @board[won?[0]] == "O"
    "O"
  else
    nil
  end
  end
end

def play
    until over? || won? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
       puts "Cat's Game!"
    else
    end
  end
end
