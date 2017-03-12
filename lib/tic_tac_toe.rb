class TicTacToe
  def initialize(board = nil)
    @board =  board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #First column
    [1,4,7], #Second column
    [2,5,8], #Third column
    [0,4,8], #Diagonal left-to-right
    [6,4,2]  #Diagonal right-to-left
  ]
  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    print "-----------\n"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    print "-----------\n"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end
  def input_to_index(user_input)
    user_input = user_input.to_i
    user_input = user_input - 1
    return user_input
  end
  def move (index, char = "X")
    @board[index] = char
    return @board
  end
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  def full?
    @board.detect{|i| i == " "} == nil
  end
  def draw?
    !won? && full?
  end
  def over?
    won? || draw?
  end
  def winner
    if won?
      return @board[won?[0]]
    end
  end
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
