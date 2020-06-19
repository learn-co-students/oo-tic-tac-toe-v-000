class TicTacToe

  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " ", ])
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # first column
    [1,4,7], # second column
    [2,5,8], # third column
    [0,4,8], # right to left diagonal
    [2,4,6], # left to right diagonal
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player_token="X")
    @board[position.to_i - 1] = player_token
  end

  # If position not taken, returns false; otherwise true
  def position_taken?(position)
    !(@board[position.to_i] == " ") 
  end

  # returns true if move is valid, false or nil if not
  def valid_move?(position)
    position.to_i.between?(1,9) && @board[position.to_i - 1] == " "
  end

  # Get input, validate it, and moke move
  def turn
    puts "Please enter 1-9: "
    position = gets.chomp
    if valid_move?(position)
      move(position, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.size - @board.count(" ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      location1 = win_combo[0]
      location2 = win_combo[1]
      location3 = win_combo[2]
      
      @board[location1] == @board[location2] && @board[location2] == @board[location3] && @board[location1] != " "
    end
  end

  def full?
    @board.none? {|location| location == " "}
  end

  # draw = full board (R true) and not won (r nil)
  def draw?
    !won? && full?  
  end

  def over?
    won? || draw?
  end
  
  def winner
    winning_combo = won?
    if winning_combo
      winning_location = winning_combo[0]
      @board[winning_location]
    end
  end  

  def play
    current_player
    until over?
       turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

# location same as position. using position a lot.
end