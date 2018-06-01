class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def input_to_index(input)
  index = input.to_i - 1
end


def move(index, player = "X")
  @board[index] = player
end


def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    @board[index] == "X" || @board[index] == "O"
    true
  end 
end


def valid_move?(index)
  if index.between?(0,8) && position_taken?(index) == false 
    true
  else position_taken?(index) == true
    false
  end
end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index) == true
    player = current_player
    move(index, player)
    display_board
  else
    turn
  end
end


def turn_count
    @board.count{|turn| turn == "X" || turn == "O"}
  end


def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


def won?
  WIN_COMBINATIONS.each do |win_comb| 
      win_index_1 = win_comb[0]
      win_index_2 = win_comb[1]
      win_index_3 = win_comb[2]
      
      position_1 = @board[win_index_1] 
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 =="X" || position_1 == "O" && position_2 == "O" && position_3 =="O"
          return win_comb
      end
    end
    false
  end


def full?
  @board.all? do |full|
     full == "X" || full == "O"
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
  if won? || draw? == true || full? == true 
    return true 
  end
end


def winner
  if won? == false
    return nil
  else
    player = won?
  winner_player = player[0]
  winner_player_1 = @board[winner_player]
  end 
end


def play
  while !over? 
      turn
  end
  if won? != false
    puts "Congratulations #{winner}!"
  elsif draw? == true 
    puts "Cat's Game!"
  end
end
end #this one is for the class