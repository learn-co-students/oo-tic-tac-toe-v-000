class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


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


  def move(index, value)
     @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    end
      return false
    end

  def valid_move?(index)
    if index.between?(0,8)
      if position_taken?(index)
        return false
      end
        return true
      end
        return false
      end


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def turn
    user_input = gets.strip
    index = input_to_index(user_input)
    if !valid_move?(index)
      turn
    else move(index, current_player)
      display_board
  end
end


def won?
  WIN_COMBINATIONS.detect do |win_combination|
   @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
     end
  end


def full?
  @board.all? {|token| token == "X" || token == "O"}
end


def draw?
  if !(won?) && full?
    return true
  end
end


def over?
  if won? || draw? || full?
    return true
  end
    return false
  end


def winner
  if(draw? || !full?) && !(won?)
    return nil
  elsif @board[won?[0]] == "X"
    return "X"
  elsif @board[won?[0]] == "O"
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

end
