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
    [6,4,2]
  ]
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
user_input.to_i-1
  end

  def move(index,value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
      @board.count{|value| value == "X" || value == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end

  def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
  value = current_player
    if valid_move?(index) == true
      move(index,value)
        @board[index] = value
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_index|
      board_position_1 = @board[win_index[0]]
      board_position_2 = @board[win_index[1]]
      board_position_3 = @board[win_index[2]]
      if board_position_1 == board_position_2 && board_position_2 == board_position_3 && position_taken?(win_index[0])
        return win_index
      end
    end
    false
  end

  def full?
    @board.none?{|space| space == " " }
  end

  def draw?
  if won? == false && full? == true
    return true
  end
end

def over?
  if won? || full? || draw? == true
    return true
  end
end

def winner
  if won? == false
    return nil
  end
  if @board[won?[0]] == "X"
    return "X"
  else "O"
  end
end

def play
  until over? == true
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else
  puts "Cat's Game!"
  end
end
end
