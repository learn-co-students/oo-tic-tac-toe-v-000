class TicTacToe
#INSTANCE VARIABLES
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

#CONSTANTS
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

#DISPLAY
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #PLAY
  def play
    until over? == true
      turn
    end

    if won? != false
      winning_token = winner
      puts "Congratulations #{winning_token}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end

#TURN
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

#ACCEPT MOVE/ VALID MOVE/ MOVE/ CURRENT PLAYER
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def move(index, player)
    @board[index] = player
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  #WIN, DRAW, and OVER
  def winner
    winning_array = won?
    if winning_array != false
        winning_token = winning_array[0]
        token = @board[winning_token]
    end
  end

  def draw?
    won = won?
    full = full?
    if won == false && full == true
      return true
    end
      false
  end

  def over?
    draw = draw?
    won = won?
    if draw == true
      return true
    elsif won != false
      return true
    end
    false
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
        return [win_index_1, win_index_2, win_index_3]
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return [win_index_1, win_index_2, win_index_3]
      end
    end
    false
  end

  def full?
    @board.all? {|position| position != " "}
  end

end
