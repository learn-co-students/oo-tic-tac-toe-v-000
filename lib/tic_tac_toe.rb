  class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5], [6,7,8],[0,3,6],[1,4,7], [2,5,8],[0,4,8],[2,4,6]]

  def initialize(board = nil )
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @input = input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index.to_i] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  if valid_move?(index)
    token = current_player
    move(index, token)
  else
    turn
  end
  display_board
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |winner_array|
    
    win_index_1 = winner_array[0]
    win_index_2 = winner_array[1]
    win_index_3 = winner_array[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return winner_array
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winner_array
    end
  end
  false
end

def full?
  @board.all?{|i| i == "X" || i == "O"}
end

def draw?
  full? && !won? 
end

def over?
  won? || draw? || full?
end

def winner
  return nil if !won?
  token = won?[0]
  if @board[token] == "X"
    return "X"
      elsif @board[token] == "O"
        return "O"
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