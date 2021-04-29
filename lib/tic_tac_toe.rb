class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    WIN_COMBINATIONS = TicTacToe.new
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(move)
   position = move.to_i - 1
   position
end

def move(position, token = "X")
  @board[position] = token
end

def valid_move?(position)
  if position.between?(0,8) && !position_taken?(position)
    puts "this is a valid move"
    return true
  else
     return false
  end
end

def position_taken?(position)
  if @board[position] == " "
    false
  elsif @board[position] == ""
    false
  elsif  @board[position] == nil
    false
  else   @board[position] == "X" || "O"
    true
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  position = input_to_index(user_input)
  if valid_move?(position)
    puts "valid move"
    move(position, current_player)
    display_board
  else
    puts "try again"
  turn
end
end

def turn_count
  count = 0
  @board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
  count
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
WIN_COMBINATIONS.find do |win_combo|
  @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[1])
end
end

def full?
  @board.none? do |i|
    i == " " || i.nil?
  end
end

def draw?
  won? == nil && full? == true
end

def over?
  if draw? == true
    true
  elsif won? != nil && full? == true
    true
  elsif won? != nil && full? == false
    true
  else
    false
  end
end

def winner
  if won? != nil
    winner = @board[won?[0]]
  end
end

def play
  until over? == true
    turn
  end
  if draw? == true
       puts "Cat's Game!"
  else won?
     puts "Congratulations #{winner}!"
   end
end
end
